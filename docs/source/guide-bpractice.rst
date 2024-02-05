*************
Best practice
*************

Test syntax

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml --syntax-check


Display and review the variables. Then disable debug
``ar_debug=false`` to speedup the playbook

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t ar_debug -e ar_debug=true


Dry-run and display changes

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml --check --diff


Install distribution packages

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t ar_packages -e ar_pkg_install=true


, or install PyPI packages

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t ar_pip -e ar_pip_install=true

The role and the configuration data in the examples are
idempotent. Once the installation and configuration have passed there
should be no changes reported by *ansible-playbook* when running the
playbook repeatedly

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook pb.yml
