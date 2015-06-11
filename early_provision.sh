#!/bin/bash

# Install Puppet and PostgreSQL module
yum install -y puppet
puppet module install puppetlabs/postgresql
