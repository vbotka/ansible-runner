*************
Best practice
*************

Test the syntax

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml --syntax-check


Display and review the variables. Then disable debug
``ar_debug=false`` to speedup the playbook

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t ar_debug -e ar_debug=true


Dry-run the playbook in the check mode and display changes

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml --check --diff


Install OS packages ``ar_pkg_install=true`` or PyPI packages
``ar_pip_install=true``. Optionally, install the packages in Python
virtual environment ``ar_venv_install=true``. Then disable the
installation to speedup the playbook

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t ar_pkg -e ar_pkg_install=true


The role and the configuration data in the examples are
idempotent. Once the installation and configuration have passed there
should be no changes reported by *ansible-playbook* when running the
playbook repeatedly

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook pb.yml
