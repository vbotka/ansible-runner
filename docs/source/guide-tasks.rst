*****
Tasks
*****

Test single tasks at single remote host *test_01*. Create the playbook *pb.yml*

.. code-block:: yaml
   :emphasize-lines: 5

   ---
   - hosts: test_01
     become: true
     roles:
       - vbotka.ansible_runner

Customize configuration, for example, in ``host_vars/test_01/ar-*.yml`` and check the syntax

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml --syntax-check

Then dry-run the selected task and see what will be changed. Replace
<tag> with valid tag

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t <tag> --check --diff

When all seems to be ready run the command. Run the command twice and
make sure the playbook and the configuration is idempotent

.. code-block:: sh
   :emphasize-lines: 1

   shell> ansible-playbook pb.yml -t <tag>
