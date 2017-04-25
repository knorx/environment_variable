[![Build Status](https://travis-ci.org/GeoffWilliams/environment_variable.svg?branch=master)](https://travis-ci.org/GeoffWilliams/environment_variable)
# environment_variable

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manage global system environment variables using Puppet on Windows and Linux.

## Usage
See reference and examples


## Reference
[generated documentation](https://rawgit.com/GeoffWilliams/environment_variable/master/doc/index.html).

Reference documentation is generated directly from source code using [puppet-strings](https://github.com/puppetlabs/puppet-strings).  You may regenerate the documentation by running:

```shell
bundle exec puppet strings
```


The documentation is no substitute for reading and understanding the module source code, and all users should ensure they are familiar and comfortable with the operations this module performs before using it.


## Limitations

* Not supported by Puppet, Inc.
* Requires an `/etc/profile.d` directory on Linux
* Performs system-wide configuration only


## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/declarativesystems/pdqtest).


Test can be executed with:

```
bundle install
make
```


See `.travis.yml` for a working CI example
