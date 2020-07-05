Example 1: Install ansible-runner in Ubuntu by pip for admin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Create a playbook

.. code-block:: yaml
   :emphasize-lines: 1

   shell> ansible-runner.yml
   - hosts: test_01
     become: true
     roles:
       - vbotka.ansible_runner

Create *host_vars/test_01/ansible-runner.yml*

.. code-block:: yaml
   :emphasize-lines: 1

    shell> cat host_vars/test_01/ansible-runner.yml
    ar_install: false
    ar_pip_install: true
    ar_debug: false
    ar_owner: admin

Install ansible-runner
    
.. code-block:: yaml
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -e "ar_install=true"
    ...
    TASK [vbotka.ansible_runner : packages: Install Ansible Runner pip packages for admin]
    ok: [test_01] => (item={'name': 'ansible-runner'})

Show ansible-runner package installed by pip for admin
    
.. code-block:: yaml
   :emphasize-lines: 1,4

   shell> whoami
   admin

   shell> pip list | grep ansible-runner
   ansible-runner               1.4.6
