Example 2: Install ansible-runner in FreeBSD from port
------------------------------------------------------

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
    <TBD>

Install ansible-runner
    
.. code-block:: yaml
   :emphasize-lines: 1

    shell> ansible-playbook ansible-runner.yml -e "ar_install=true"
    <TBD>
    ...
    TASK [vbotka.ansible_runner : packages: Install Ansible Runner pip packages for admin]
    ok: [test_01] => (item={'name': 'ansible-runner'})

Show ansible-runner package installed by pip for admin
    
.. code-block:: yaml
   :emphasize-lines: 1,4

   shell> whoami
    <TBD>

   shell> which ansible-runner
   ansible-runner               1.4.6
