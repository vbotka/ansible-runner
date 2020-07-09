*************
Best practice
*************

Display the variables for debug if needed. Then disable this task
``ar_debug: false`` to speedup the playbook

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook ansible-runner.yml -t ar_debug

Install packages Then disable this task ``ar_install: false`` to speedup the playbook

.. code-block:: sh
   :emphasize-lines: 1-2

   shell> ansible-playbook ansible-runner.yml -t ar_packages \
                                              -e 'ar_install=true'

The role and the configuration data in the examples are
idempotent. Once the installation and configuration have passed there
should be no changes reported by *ansible-playbook* when running the
playbook repeatedly. Disable debug, and install to speedup the
playbook

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml
