PyPI or OS distro packages
==========================

``ansible-runner`` can be installed by ``pip``

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t ar_pip -e ar_pkg_install=false ar_pip_install=true


,or from distribution's ``packages``, and ports

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t ar_packages -e ar_pkg_install=true ar_pip_install=false


Examples
--------

.. toctree::

   task-packages-ex1
   task-packages-ex2

.. seealso::

   * Annotated Source code :ref:`as_packages.yml`
   * Annotated Source code :ref:`as_pip.yml`
