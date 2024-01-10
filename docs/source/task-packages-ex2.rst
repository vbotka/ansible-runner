Example 2: Install ansible-runner in FreeBSD from port
------------------------------------------------------

Create a playbook

.. code-block:: yaml
   :emphasize-lines: 1

   shell> cat pb.yml
   - hosts: test_01
     become: true
     roles:
       - vbotka.ansible_runner

Create variables in the file *host_vars/test_01/ansible-runner.yml*

.. code-block:: yaml
   :emphasize-lines: 1

    shell> cat host_vars/test_01/ansible-runner.yml
    ar_pkg_install: true
    ar_pip_install: false
    ar_debug: false
    freebsd_install_method: ports
    freebsd_use_packages: true

Install ansible-runner
    
.. code-block:: sh
   :emphasize-lines: 1

    shell> ansible-playbook pb.yml
    ...
    TASK [vbotka.ansible_runner : packages: Install Ansible Runner FreeBSD ports]
    changed: [test_01] => (item=sysutils/py-ansible-runner)

Show ansible-runner package was installed
    
.. code-block:: yaml
   :emphasize-lines: 1,4,7

   shell> whoami
   admin

   shell> pkg info | grep ansible-runner
   py39-ansible-runner-2.3.2      Extensible embeddable ansible job runner
   
   shell> which ansible-runner
   /usr/local/bin/ansible-runner
