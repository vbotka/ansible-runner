************
Introduction
************

This role to installs and configures Ansible Runner. Optionally,
configure cron to periodically run Ansible playbooks.

* Ansible role: `ansible_runner <https://galaxy.ansible.com/vbotka/ansible_runner/>`_
* Supported systems:

  * `FreeBSD Supported Production Releases <https://www.freebsd.org/releases/>`_

  * `Ubuntu Supported Releases <http://releases.ubuntu.com/>`_

* Requirements: `ansible_lib <https://galaxy.ansible.com/vbotka/ansible_lib>`_

.. note::

   * The utility *ansible-runner* is not part of standard Ansible
     installation.
   * See `Installing Ansible Runner <https://ansible-runner.readthedocs.io/en/latest/install.html>`_

.. seealso::

   * `Ansible Runner documentation <https://ansible-runner.readthedocs.io/en/latest/>`_
   * `Ansible Runner source code <https://github.com/ansible/ansible-runner>`_
   * `REST API ansible-runner-service <https://github.com/ansible/ansible-runner-service>`_

.. warning::

   `Conclusions. The pip module isn't always idempotent #28952 <https://github.com/ansible/ansible/issues/28952>`_
   Quoting: "Managing system site-packages with Pip is not a good idea
   and will probably break your OS. Those should be solely managed by
   the OS package manager (apt/yum/dnf/etc.). If you want to manage
   env for some software in Python, better use a virtualenv technology."
