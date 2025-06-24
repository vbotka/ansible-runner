Install ansible-runner package
==============================

There are three options:

* Install OS-specific packages
* Install PyPI package
* Install PyPI package in Python virtual environment

By default, nothing will be installed:

.. code-block:: yaml

   ar_pkg_install: false
   ar_pip_install: false
   ar_venv_install: false

.. warning::

   By default, *ar_pkg_install*, *ar_pip_install*, and *ar_venv_install* are mutually
   exclusive. Disable *ar_sanity_pip_exclusive* if you want to install more options in the same
   play.

Install OS-specific packages
----------------------------

Dry run the installation and see what will be installed ::

  shell> ansible-playbook pb.yml -t ar_pkg -e ar_debug=true -e ar_pkg_install=true -CD

If all is right install the package ::

  shell> ansible-playbook pb.yml -t ar_pkg -e ar_debug=true -e ar_pkg_install=true
		
.. seealso::

   * Annotated Source code :ref:`as_pkg.yml`

Install PyPI package
--------------------

Dry run the installation and see what will be installed ::

  shell> ansible-playbook pb.yml -t ar_pip -e ar_debug=true -e ar_pip_install=true -CD

If all is right install the package ::

  shell> ansible-playbook pb.yml -t ar_pip -e ar_debug=true -e ar_pip_install=true

.. seealso::

   * Annotated Source code :ref:`as_pip.yml`

.. warning::

   `Conclusions. The pip module isn't always idempotent #28952`_ Quoting: "Managing system
   site-packages with Pip is not a good idea and will probably break your OS. Those should be solely
   managed by the OS package manager (apt/yum/dnf/etc.). If you want to manage env for some software
   in Python, better use a virtualenv technology."
     
Install PyPI package in Python virtual environment
--------------------------------------------------

Dry run the installation and see what will be installed ::

  shell> ansible-playbook pb.yml -t ar_venv -e ar_debug=true -e ar_venv_install=true -CD

If all is right install the package ::

  shell> ansible-playbook pb.yml -t ar_venv -e ar_debug=true -e ar_venv_install=true

.. seealso::

   * Annotated Source code :ref:`as_venv.yml`

Examples
--------

.. toctree::

   task-packages-ex1
   task-packages-ex2

.. _Conclusions. The pip module isn't always idempotent #28952: https://github.com/ansible/ansible/issues/28952
