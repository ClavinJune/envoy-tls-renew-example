# envoy-tls-renew-example
A minimum code to enable &amp; renew TLS certificate on envoy.

## Disclaimer
This repository only cover a minimum code to handle tls certificate on envoy using SDS, **you might want to modify the code for production use**.

## dependencies
- docker
- docker-compose
- docker image envoyproxy/envoy:v1.18.3
- openssl

## How to run
1. `$ make init-tls`
2. `$ make run`
3. `$ curl -vLk localhost`
4. check the Server certificate section
5. try to renew the certificate by `$ make renew-tls`
6. back to step 3
