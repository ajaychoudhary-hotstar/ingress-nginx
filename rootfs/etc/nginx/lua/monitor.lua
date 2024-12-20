local ngx = ngx
local tonumber = tonumber
local assert = assert
local string = string
local tostring = tostring
local socket = ngx.socket.tcp
local cjson = require("cjson.safe")
local new_tab = require "table.new"
local clear_tab = require "table.clear"
local table = table
local pairs = pairs


-- if an Nginx worker processes more than (MAX_BATCH_SIZE/FLUSH_INTERVAL) RPS
-- then it will start dropping metrics
local MAX_BATCH_SIZE = 10000
local FLUSH_INTERVAL = 1 -- second

local metrics_batch = new_tab(MAX_BATCH_SIZE, 0)
local metrics_count = 0

-- for save json raw metrics table
local metrics_raw_batch = new_tab(MAX_BATCH_SIZE, 0)

local _M = {}

local function send(payload)
  local s = assert(socket())
  assert(s:connect("unix:/tmp/nginx/prometheus-nginx.socket"))
  assert(s:send(payload))
  assert(s:close())
end

local function metrics()
  return {
    host = ngx.var.host or "-",
    namespace = ngx.var.namespace or "-",
    ingress = ngx.var.ingress_name or "-",
    service = ngx.var.service_name or "-",
    canary = ngx.var.proxy_alternative_upstream_name or "-",
    path = ngx.var.location_path or "-",

    method = ngx.var.request_method or "-",
    status = ngx.var.status or "-",
    requestLength = tonumber(ngx.var.request_length) or -1,
    requestTime = tonumber(ngx.var.request_time) or -1,
    responseLength = tonumber(ngx.var.bytes_sent) or -1,

    upstreamLatency = tonumber(ngx.var.upstream_connect_time) or -1,
    upstreamHeaderTime = tonumber(ngx.var.upstream_header_time) or -1,
    upstreamResponseTime = tonumber(ngx.var.upstream_response_time) or -1,
    upstreamResponseLength = tonumber(ngx.var.upstream_response_length) or -1,
    upstreamCacheStatus = ngx.var.upstream_cache_status or "-",
    --upstreamStatus = ngx.var.upstream_status or "-",
  }
end

local function flush(premature)
  if premature then
    return
  end

  if metrics_count == 0 then
    return
  end

  metrics_count = 0
  clear_tab(metrics_batch)

  local request_metrics = {}
  table.insert(request_metrics, "[")
  for i in pairs(metrics_raw_batch) do
    local item = metrics_raw_batch[i] ..","
    if i == table.getn(metrics_raw_batch) then
      item = metrics_raw_batch[i]
    end
    table.insert(request_metrics, item)
  end
  table.insert(request_metrics, "]")
  local payload = table.concat(request_metrics)

  clear_tab(metrics_raw_batch)
  send(payload)
end

local function set_metrics_max_batch_size(max_batch_size)
  if max_batch_size > 10000 then
    MAX_BATCH_SIZE = max_batch_size
  end
end

function _M.init_worker(max_batch_size)
  set_metrics_max_batch_size(max_batch_size)
  local _, err = ngx.timer.every(FLUSH_INTERVAL, flush)
  if err then
    ngx.log(ngx.ERR, string.format("error when setting up timer.every: %s", tostring(err)))
  end
end

function _M.call()
  if metrics_count >= MAX_BATCH_SIZE then
    ngx.log(ngx.WARN, "omitting metrics for the request, current batch is full")
    return
  end

  local metrics_obj = metrics()
  local payload, err = cjson.encode(metrics_obj)
  if err then
    ngx.log(ngx.ERR, string.format("error when encoding metrics: %s", tostring(err)))
    return
  end

  metrics_count = metrics_count + 1
  metrics_batch[metrics_count] = metrics_obj
  metrics_raw_batch[metrics_count] = payload
end

setmetatable(_M, {__index = {
  flush = flush,
  set_metrics_max_batch_size = set_metrics_max_batch_size,
  get_metrics_batch = function() return metrics_batch end,
}})

return _M
