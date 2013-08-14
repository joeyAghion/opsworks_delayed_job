opsworks_delayed_job
====================

These recipes set up an [AWS OpsWorks](http://aws.amazon.com/opsworks/) instance to run [delayed_job](https://github.com/collectiveidea/delayed_job) workers for a Rails application.


Configuration Examples
----------------------

By default, **4** delayed_job workers will be configured. To customize this, you may override the `delayed_job.pool_size` attribute in your stack's custom JSON:

    {
      "delayed_job": { "pool_size": 6 }
    }

By default, workers will read from all queues. You can also specify custom `queues` parameters by adding attributes corresponding to each instance name and worker process. A special `default` pool can be specified to supply configuration for instances that don't otherwise appear in the JSON:

    {
      "delayed_job": {
        "YOUR_APP_NAME": {
          "pools": {
            "worker1": {
              "0": { "queues": "highpriority,images" },
              "1": { "queues": "emails" },
              "2": { "queues": "images" }
            },
            "default": {
              "0": { "queues": "emails" },
              "1": { "queues": "emails" },
              "2": { "queues": "emails" }
            }
          }
        }
      }
    }


OpsWorks Set-Up
---------------

The layer's custom chef recipes should be associated with events as follows:

* **Setup**: `opsworks_delayed_job::setup`
* **Configure**: `opsworks_delayed_job::configure`
* **Deploy**: `opsworks_delayed_job::deploy`
* **Undeploy**: `opsworks_delayed_job::undeploy`
* **Shutdown**: `opsworks_delayed_job::stop`


To Do
-----

* Attributes should be better structured (allowing customization without requiring all worker processes to be listed).
* Loosen any coupling to the nginx+unicorn Rails stack.


License
-------

See [LICENSE](LICENSE).


&copy; 2013 Joey Aghion, Artsy Inc.
