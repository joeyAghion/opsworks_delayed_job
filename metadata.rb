name             "opsworks_delayed_job"
maintainer       "Artsy"
maintainer_email "it@artsymail.com"
license          "MIT"
description      "Configure and deploy background job workers."
version          "0.8"

recipe 'opsworks_delayed_job::setup', 'Set up delayed_job worker.'
recipe 'opsworks_delayed_job::configure', 'Configure delayed_job worker.'
recipe 'opsworks_delayed_job::deploy', 'Deploy delayed_job worker.'
recipe 'opsworks_delayed_job::undeploy', 'Undeploy delayed_job worker.'
recipe 'opsworks_delayed_job::stop', 'Stop delayed_job worker.'

# An explicit dependency on Opsworks' deploy cookbook was necessary with Chef <11.10,
# but this isn't compatible with Berkshelf.
# depends 'deploy'
