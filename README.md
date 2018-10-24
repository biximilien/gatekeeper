<img src="./docs/logo.png" width="150px"/>

[![Build Status][badge-travis-image]][badge-travis-url]

Gatekeeper is a cloud-native, fast, scalable, and distributed Microservice
Abstraction Layer *(also known as an API Gateway, API Middleware or in some
cases Service Mesh)*. Started as an open-source project in 2018, its
core values are high performance and extensibility.

Actively maintained, Gatekeeper is widely used in production at companies ranging
from startups to Global 5000 as well as government organizations.

[Installation](https://jaswdr.github.io/gatekeeper/#install) |
[Documentation](https://jaswdr.github.io/gatekeeper/) |

## Summary

- [**Why Gatekeeper?**](#why-gatekeeper)
- [**Features**](#features)
- [**Distributions**](#distributions)
- [**Development**](#development)
- [**Demo**](#demo)
- [**License**](#license)

## Why Gatekeeper?

If you are building for web, mobile or IoT (Internet of Things) you will likely
end up needing common functionality to run your actual software. Gatekeeper can
help by acting as a gateway (or a sidecar) for microservices requests while
providing load balancing, logging, authentication, rate-limiting,
transformations, and more through plugins.

[![][gatekeeper-benefits]][gatekeeper-url]

## Features

- **Cloud-Native**: Platform agnostic, Gatekeeper can run from bare metal to
  Kubernetes.
- **Dynamic Load Balancing**: Load balance traffic across multiple upstream
  services.
- **Hash-based Load Balancing**: Load balance with consistent hashing/sticky
  sessions.
- **Circuit-Breaker**: Intelligent tracking of unhealthy upstream services.
- **Health Checks:** Active and passive monitoring of your upstream services.
- **Service Discovery**: Resolve SRV records in third-party DNS resolvers like
  Consul.
- **Serverless**: Invoke and secure AWS Lambda or OpenWhisk functions directly
  from Gatekeeper.
- **WebSockets**: Communicate to your upstream services via WebSockets.
- **OAuth2.0**: Easily add OAuth2.0 authentication to your APIs.
- **Logging**: Log requests and responses to your system over HTTP, TCP, UDP,
  or to disk.
- **Security**: ACL, Bot detection, whitelist/blacklist IPs, etc...
- **Syslog**: Logging to System log.
- **SSL**: Setup a Specific SSL Certificate for an underlying service or API.
- **Monitoring**: Live monitoring provides key load and performance server
  metrics.
- **Forward Proxy**: Make Gatekeeper connect to intermediary transparent HTTP proxies.
- **Authentications**: HMAC, JWT, Basic, and more.
- **Rate-limiting**: Block and throttle requests based on many variables.
- **Transformations**: Add, remove, or manipulate HTTP requests and responses.
- **Caching**: Cache and serve responses at the proxy layer.
- **CLI**: Control your Gatekeeper cluster from the command line.
- **REST API**: Gatekeeper can be operated with its RESTful API for maximum
  flexibility.
- **Geo-Replicated**: Configs are always up-to-date across different regions.
- **Failure Detection & Recovery**: Gatekeeper is unaffected if one of your Cassandra
  nodes goes down.
- **Clustering**: All Gatekeeper nodes auto-join the cluster keeping their config
  updated across nodes.
- **Scalability**: Distributed by nature, Gatekeeper scales horizontally by simply
  adding nodes.
- **Performance**: Gatekeeper handles load with ease by scaling and using NGINX at
  the core.
- **Plugins**: Extendable architecture for adding functionality to Gatekeeper and
  APIs.

For more info about plugins and integrations, you can check out the [Gatekeeper
Hub](https://docs.gatekeeperhq.com/hub/).

## Distributions

Gatekeeper comes in many shapes. While this repository contains its core's source
code, other repos are also under active development:

- [Gatekeeper Docker](https://github.com/Gatekeeper/docker-gatekeeper): A Dockerfile for
  running Gatekeeper in Docker.
- [Gatekeeper Packages](https://github.com/jaswdr/gatekeeper/releases): Pre-built packages
  for Debian, Red Hat, and OS X distributions (shipped with each release).
- [Gatekeeper Vagrant](https://github.com/jaswdr/gatekeeper-vagrant): A Vagrantfile for
  provisioning a development ready environment for Gatekeeper.
- [Gatekeeper Homebrew](https://github.com/Gatekeeper/homebrew-gatekeeper): Homebrew Formula
  for Gatekeeper.
- [Gatekeeper CloudFormation](https://github.com/jaswdr/gatekeeper-dist-cloudformation):
  Gatekeeper in a 1-click deployment for AWS EC2
- [Gatekeeper AWS AMI](https://aws.amazon.com/marketplace/pp/B014GHERVU): Gatekeeper AMI on
  the AWS Marketplace.
- [Gatekeeper on Microsoft Azure](https://github.com/jaswdr/gatekeeper-dist-azure): Run Gatekeeper
  using Azure Resource Manager.
- [Gatekeeper on Heroku](https://github.com/heroku/heroku-gatekeeper): Deploy Gatekeeper on
  Heroku in one click.
- [Gatekeeper and Instaclustr](https://www.instaclustr.com/solutions/managed-cassandra-for-gatekeeper/): Let
  Instaclustr manage your Cassandra cluster.
- [Kubernetes Ingress Controller for Gatekeeper](https://github.com/Gatekeeper/kubernetes-ingress-controller):
  Use Gatekeeper for Kubernetes Ingress.
- [Nightly Builds][gatekeeper-nightly-master]: Builds of the master branch available
  every morning at about 9AM PST.

## Development

If you are planning on developing on Gatekeeper, you'll need a development
installation. The `next` branch holds the latest unreleased source code.

You can read more about writing your own plugins in the [Plugin Development
Guide](https://docs.gatekeeperhq.com/latest/plugin-development/), or browse an
online version of Gatekeeper's source code documentation in the [Plugin development
Kit (PDK) Reference](https://docs.gatekeeperhq.com/latest/pdk/).

#### Vagrant

You can use a Vagrant box running Gatekeeper and Postgres that you can find at
[jaswdr/gatekeeper-vagrant](https://github.com/jaswdr/gatekeeper-vagrant).

#### Source Install

Gatekeeper mostly is an OpenResty application made of Lua source files, but also
requires some additional third-party dependencies. We recommend installing
those by following the source install instructions at
https://docs.gatekeeperhq.com/install/source/.

Instead of following the second step (Install Gatekeeper), clone this repository
and install the latest Lua sources instead of the currently released ones:

```shell
$ git clone https://github.com/jaswdr/gatekeeper
$ cd gatekeeper/

# you might want to switch to the development branch. See CONTRIBUTING.md
$ git checkout next

# install the Lua sources
$ luarocks make
```

#### Running for development

Check out the [development section](https://github.com/jaswdr/gatekeeper/blob/next/gatekeeper.conf.default#L244)
of the default configuration file for properties to tweak in order to ease
the development process for Gatekeeper.

Modifying the [`lua_package_path`](https://github.com/openresty/lua-nginx-module#lua_package_path)
and [`lua_package_cpath`](https://github.com/openresty/lua-nginx-module#lua_package_cpath)
directives will allow Gatekeeper to find your custom plugin's source code wherever it
might be in your system.

#### Tests

Install the development dependencies ([busted], [luacheck]) with:

```shell
$ make dev
```

Gatekeeper relies on three test suites using the [busted] testing library:

* Unit tests
* Integration tests, which require Postgres and Cassandra to be up and running
* Plugins tests, which require Postgres to be running

The first can simply be run after installing busted and running:

```
$ make test
```

However, the integration and plugins tests will spawn a Gatekeeper instance and
perform their tests against it. As so, consult/edit the `spec/gatekeeper_tests.conf`
configuration file to make your test instance point to your Postgres/Cassandra
servers, depending on your needs.

You can run the integration tests (assuming **both** Postgres and Cassandra are
running and configured according to `spec/gatekeeper_tests.conf`) with:

```
$ make test-integration
```

And the plugins tests with:

```
$ make test-plugins
```

Finally, all suites can be run at once by simply using:

```
$ make test-all
```

Consult the [run_tests.sh](.ci/run_tests.sh) script for a more advanced example
usage of the tests suites and the Makefile.

Finally, a very useful tool in Lua development (as with many other dynamic
languages) is performing static linting of your code. You can use [luacheck]
\(installed with `make dev`\) for this:

```
$ make lint
```

#### Makefile

When developing, you can use the `Makefile` for doing the following operations:

| Name               | Description                                            |
| ------------------:| -------------------------------------------------------|
| `install`          | Install the Gatekeeper luarock globally                      |
| `dev`              | Install development dependencies                       |
| `lint`             | Lint Lua files in `gatekeeper/` and `spec/`                  |
| `test`             | Run the unit tests suite                               |
| `test-integration` | Run the integration tests suite                        |
| `test-plugins`     | Run the plugins test suite                             |
| `test-all`         | Run all unit + integration + plugins tests at once     |

## Enterprise Support & Demo

If you are working in a large organization you should learn more about [Gatekeeper
Enterprise](https://jaswdr.github.io/gatekeeper/gatekeeper-enterprise-edition/).

## License

```
Copyright 2016-2018 Gatekeeper Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[gatekeeper-nightly-master]: https://bintray.com/gatekeeper/gatekeeper-community-edition-nightly/gatekeeper-master
[badge-travis-url]: https://travis-ci.org/jaswdr/gatekeeper/branches
[badge-travis-image]: https://travis-ci.org/jaswdr/gatekeeper.svg?branch=master

[busted]: https://github.com/Olivine-Labs/busted
[luacheck]: https://github.com/mpeterv/luacheck
