# Changelog

### 1.6.4

Images:

* registry.k8s.io/controller:controller-v1.6.4@sha256:15be4666c53052484dd2992efacf2f50ea77a78ae8aa21ccd91af6baaa7ea22f
* registry.k8s.io/controller-chroot:controller-v1.6.4@sha256:0de01e2c316c3ca7847ca13b32d077af7910d07f21a4a82f81061839764f8f81

### All changes:

* remove tests and regex path checks (#9626)
* Fix incorrect annotation name in upstream hashing configuration (#9617)
* Release docs for Controller v1.6.3 and Helm v4.5.0 (#9614)
* Revert Implement pathType validation (#9511) (#9607)
* update history and allow to pass a target test  (#9605)
* Allow to pass a target test (#9542)
* Replace deprecated command with environment file (#9581)
* build 1.6.2 to fix (#9569)
* add lint on chart before release (#9570)
* tcpproxy: increase buffer size to 16K (#9548)
* Move and spell-check Kubernetes 1.22 migration FAQ (#9544)
* Add CORS template check inside location for externalAuth.SignURL (#8814)
* fix(grafana-dashboard): remove hardcoded namespace references (#9523)
* Replace deprecated command with environment file (#9581)
* add lint on chart before release (#9570)
* Switch logic on path type validation and setting it to false (#9543)
* tcpproxy: increase buffer size to 16K (#9548)
* Move and spell-check Kubernetes 1.22 migration FAQ (#9544)
* Add CORS template check inside location for externalAuth.SignURL (#8814)
* fix(grafana-dashboard): remove hardcoded namespace references (#9523)
* Align default value for keepalive_request with NGINX default (#9518)
* feat(configmap): expose gzip-disable (#9505)
* Values: Add missing `controller.metrics.service.labels`. (#9501)
* Add docs about orphan_ingress metric (#9514)
* Add new prometheus metric for orphaned ingress (#8230)
* Sanitise request metrics in monitoring docs (#9384)
* Change default value of enable-brotli (#9500)
* feat: support topology aware hints (#9165)
* Remove 1.5.2 from readme (#9498)
* Remove nonexistent load flag from docker build commands (#9122)
* added option to disable sync event creation (#8528)
* Add buildResolvers to the stream module (#9184)
* fix: disable auth access logs (#9049)
* Adding ipdenylist annotation (#8795)
* Add update updateStrategy and minReadySeconds for defaultBackend (#8506)
* Fix indentation on serviceAccount annotation (#9129)
* Update monitoring.md (#9269)
* add github actions stale bot (#9439)
* Admission Webhooks/Job: Add `NetworkPolicy`. (#9218)
* update OpenTelemetry image (#9491)
* bump OpenTelemetry (#9489)
* Optional podman support (#9294)
* fix change images (#9463)
* move tests to gh actions (#9461)
* Automated Release Controller 1.5.2 (#9455)
* Add sslpassthrough tests (#9457)
* updated the link in RELEASE.md file (#9456)
* restart 1.5.2 release process (#9450)
* Update command line arguments documentation (#9224)
* start release 1.5.2 (#9445)
* upgrade nginx base image (#9436)
* test the new e2e test images (#9444)
* avoid builds and tests for non-code changes (#9392)
* CI updates (#9440)
* HPA: Add `controller.autoscaling.annotations` to `values.yaml`. (#9253)
* update the nginx run container for alpine:3.17.0 (#9430)
* cleanup: remove ioutil for new go version (#9427)
* start upgrade to golang 1.19.4 and alpine 3.17.0 (#9417)
* ci: remove setup-helm step (#9404)
* ci: remove setup-kind step (#9401)
* Add reporter for all tests (#9395)
* added action for issues to project (#9386)
* doc: update NEW_CONTRIBUTOR.md (#9381)
* feat(helm): Optionally use cert-manager instead admission patch (#9279)
* integrated junit-reports with ghactions (#9361)
* [user-guide configmap] fix doc for global-auth-snippet (#9372)
* update OpenTelemetry image (#9308)
* fix: missing CORS headers when auth fails (#9251)
* Fix styling in canary annotation docs. (#9259)
* resolved ginkgo deprecation message (#9365)
* Enable profiler-address to be configured (#9311)
* ModSecurity dependencies update to avoid Memory Leaks (#9330)
* fix(hpa): deprecated api version, bump to v2 (#9348)
* fix(typo): pluralize provider (#9346)
* removed deprecation messsage for ingressClass annotation (#9357)
* added ginkgo junit reports (#9350)
* Fix typos found by codespell (#9353)
* bumped ginkgo to v2.5.1 in testrunner (#9340)
* create nsswitch-conf if missing (#9339)
* remove the configmap related permissions (#9310)
* remove hardcoded datasource from grafana dashboard (#9284)
* update gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b to 3.0.0 (#9277)
* added SAN to cert create command (#9295)
* Missing controller.ingressClass (#9304)
* OpenTelemetry static linking (#9286)
* Fixed indentation in commented-out autoscaling (#9225)
* run helm release on main only and when the chart/value changes only (#9290)
* fix broken annotation yaml (#9243)
* PDB: Add `maxUnavailable`. (#9278)
* add containerSecurityContext to extraModules init containers (kubernetes#9016) (#9242)

### Dependency updates:

* Bump google.golang.org/grpc from 1.52.0 to 1.52.3 (#9555)
* Bump k8s.io/klog/v2 from 2.80.1 to 2.90.0 (#9553)
* Bump sigs.k8s.io/controller-runtime from 0.13.1 to 0.14.2 (#9552)
* Bump google.golang.org/grpc from 1.51.0 to 1.52.0 (#9512)
* Bump `client-go` to remove dependence on go-autorest dependency (#9488)
* Bump google.golang.org/grpc from 1.52.0 to 1.52.3 (#9555)
* Bump k8s.io/klog/v2 from 2.80.1 to 2.90.0 (#9553)
* Bump sigs.k8s.io/controller-runtime from 0.13.1 to 0.14.2 (#9552)
* Bump google.golang.org/grpc from 1.51.0 to 1.52.0 (#9512)
* Bump `client-go` to remove dependence on go-autorest dependency (#9488)
* Bump golang.org/x/crypto from 0.4.0 to 0.5.0 (#9494)
* Bump golang.org/x/crypto from 0.3.0 to 0.4.0 (#9397)
* Bump github.com/onsi/ginkgo/v2 from 2.6.0 to 2.6.1 (#9432)
* Bump github.com/onsi/ginkgo/v2 from 2.6.0 to 2.6.1 (#9421)
* Bump github/codeql-action from 2.1.36 to 2.1.37 (#9423)
* Bump actions/checkout from 3.1.0 to 3.2.0 (#9425)
* Bump goreleaser/goreleaser-action from 3.2.0 to 4.1.0 (#9426)
* Bump actions/dependency-review-action from 3.0.1 to 3.0.2 (#9424)
* Bump ossf/scorecard-action from 2.0.6 to 2.1.0 (#9422)
* Bump github.com/prometheus/common from 0.37.0 to 0.39.0 (#9416)
* Bump github.com/onsi/ginkgo/v2 from 2.5.1 to 2.6.0 (#9408)
* Bump github.com/onsi/ginkgo/v2 from 2.5.1 to 2.6.0 (#9398)
* Bump github/codeql-action from 2.1.35 to 2.1.36 (#9400)
* Bump actions/setup-go from 3.3.1 to 3.4.0 (#9370)
* Bump github/codeql-action from 2.1.31 to 2.1.35 (#9369)
* Bump google.golang.org/grpc from 1.50.1 to 1.51.0 (#9316)
* Bump github.com/prometheus/client_golang from 1.13.1 to 1.14.0 (#9298)
* Bump actions/dependency-review-action from 3.0.0 to 3.0.1 (#9319)
* Bump golang.org/x/crypto from 0.1.0 to 0.3.0 (#9318)
* Bump github.com/onsi/ginkgo/v2 from 2.4.0 to 2.5.1 (#9317)
* Bump actions/dependency-review-action from 2.5.1 to 3.0.0 (#9301)
* Bump k8s.io/component-base from 0.25.3 to 0.25.4 (#9300)

**Full Changelog**: https://github.com/kubernetes/ingress-nginx/compare/controller-controller-v1.5.1...controller-controller-v1.6.4