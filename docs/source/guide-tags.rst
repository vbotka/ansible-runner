****
Tags
****

The tags provide the user with a very useful tool to run selected
tasks of the role. To see what tags are available list the tags of the
role:

.. include:: tags-list.rst

For example, display the list of the variables and their values with
the tag ``ar_debug`` (when the debug is enabled ``ar_debug=true``)

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_debug -e ar_debug=true


ar_packages
===========

If the packages listed in ``ar_packages`` are available in the
distribution enable the installation ``ar_pkg_install=true`` and see if the packages
can be installed

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_packages --check

Install the packages

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_packages


ar_pip
======

If the PyPI packages listed in ``ar_packages`` are available enable the installation ``ar_pip_install=true`` and see if the packages can be installed

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_pip --check

Install the packages

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_pip

.. warning::

   *ar_pkg_install* and *ar_pip_install* are mutually exclusive. It is not
   possible to install OS distro packages and PyPI packages in the
   same play.
