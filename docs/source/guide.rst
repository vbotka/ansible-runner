.. _ug:

############
User's guide
############
.. contents:: Table of Contents
   :depth: 4


.. _ug_introduction:

************
Introduction
************

Run this role to install and configure Ansible Runner. Optionaly
configure cron to periodically run Ansible playbooks.

* Ansible role: `ansible_runner <https://galaxy.ansible.com/vbotka/ansible_runner/>`_
* Supported systems:

  * `FreeBSD Supported Production Releases <https://www.freebsd.org/releases/>`_
  * `Ubuntu Supported Releases <http://releases.ubuntu.com/>`_
* (Requirements in future releases: `ansible_lib <https://galaxy.ansible.com/vbotka/ansible_lib>`_)

.. note::
   * The utility *ansible-runner* is not part of standard Ansible
     installation. See `Installing Ansible Runner
     <https://ansible-runner.readthedocs.io/en/latest/install.html>`_

.. seealso::
   * `Ansible Runner documentation <https://ansible-runner.readthedocs.io/en/latest/>`_
   * `Ansible Runner source code <https://github.com/ansible/ansible-runner>`_
   * `REST API ansible-runner-service <https://github.com/ansible/ansible-runner-service>`_

.. _ug_installation:

************
Installation
************

The most convenient way how to install an Ansible role is to use
Ansible Galaxy CLI ``ansible-galaxy``. The utility comes with the
standard Ansible package and provides the user with a simple interface
to the Ansible Galaxy's services. For example, take a look at the
current status of the role

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-galaxy info vbotka.ansible_runner

and install it

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-galaxy install vbotka.ansible_runner

Install the library of tasks (for future releases)

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-galaxy install vbotka.ansible_lib

.. seealso::
   * To install specific versions from various sources see `Installing content <https://galaxy.ansible.com/docs/using/installing.html>`_.
   * Take a look at other roles ``shell> ansible-galaxy search --author=vbotka``


.. _ug_playbook:

********
Playbook
********

Below is a simple playbook that calls this role at a single host
srv.example.com (2)

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat ansible-runner.yml
   - hosts: srv.example.com
     gather_facts: true
     connection: ssh
     remote_user: admin
     become: yes
     become_user: root
     become_method: sudo
     roles:
       - vbotka.ansible_runner

.. note:: ``gather_facts: true`` (3) must be set to gather facts
   needed to evaluate OS-specific options of the role. For example to
   install packages the variable ``ansible_os_family`` is needed to
   select the appropriate Ansible module.

.. seealso::
   * For details see `Connection Plugins <https://docs.ansible.com/ansible/latest/plugins/connection.html>`__ (4-5)
   * See also `Understanding Privilege Escalation <https://docs.ansible.com/ansible/latest/user_guide/become.html#understanding-privilege-escalation>`__ (6-8)


.. _ug_debug:

*****
Debug
*****

To see additional debug information enable debug output in the
configuration

.. code-block:: yaml
   :emphasize-lines: 1

   ar_debug: true

, or set the extra variable in the command

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook ansible-runner.yml -e 'ar_debug=true'

.. note:: The debug output of this role is optimized for the **yaml**
   callback plugin. Set this plugin for example in the environment
   ``shell> export ANSIBLE_STDOUT_CALLBACK=yaml``.

.. seealso:: * `Playbook Debugger <https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html>`_


.. _ug_tags:

****
Tags
****

The tags provide the user with a very useful tool to run selected
tasks of the role. To see what tags are available list the tags of the
role with the command

.. include:: tags-list.rst

For example, display the list of the variables and their values with
the tag ``ar_debug`` (when the debug is enabled ``ar_debug: true``)

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_debug

See what packages will be installed

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_packages --check

Install packages and exit the play

.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -t ar_packages


.. _ug_tasks:

*****
Tasks
*****

Test single tasks at single remote host *test_01*. Create a playbook

.. code-block:: yaml
   :emphasize-lines: 1

   shell> cat ansible.yml
   - hosts: test_01
     become: true
     roles:
       - vbotka.ansible_runner

Customize configuration in ``host_vars/test_01/ar-*.yml`` and check the syntax

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook ansible-runner.yml --syntax-check

Then dry-run the selected task and see what will be changed. Replace
<tag> with valid tag.

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook ansible-runner.yml -t <tag> --check --diff

When all seems to be ready run the command. Run the command twice and
make sure the playbook and the configuration is idempotent

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook ansible-runner.yml -t <tag>

.. _ug_task_packages:
.. include:: task-packages.rst
.. toctree::
   :caption: Examples
   :name: task-packages-examples

   task-packages-ex1
   task-packages-ex2

.. _ug_task_packages_ex1:
.. include:: task-packages-ex1.rst
.. _ug_task_packages_ex2:
.. include:: task-packages-ex2.rst


.. _ug_vars:

*********
Variables
*********

In this chapter we describe role's default variables stored in the
directory **defaults**.

.. seealso:: * `Ansible variable precedence: Where should I put a variable? <https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable>`_


.. _ug_defaults:

*****************
Default variables
*****************

  <TBD>

[`defaults/main.yml <https://github.com/vbotka/ansible-runner/blob/master/defaults/main.yml>`_]

.. highlight:: yaml
    :linenothreshold: 5
.. literalinclude:: ../../defaults/main.yml
    :language: yaml
    :emphasize-lines: 2
    :linenos:


.. _ug_bp:

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


.. _ug_examples:

*****************************
Ansible Runner Usage Examples
*****************************

Cron
====

.. _ug_cron_example1:
.. include:: cron-example1.rst

Job events
==========

.. _ug_events_example1:
.. include:: events-example1.rst
