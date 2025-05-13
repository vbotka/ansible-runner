Playbook
********

Below is a simple playbook *pb.yml* that calls this role (10) at a single host srv.example.com (2)

.. code-block:: yaml
   :emphasize-lines: 2,10
   :linenos:

   ---
   - hosts: srv.example.com
     gather_facts: true
     connection: ssh
     remote_user: admin
     become: true
     become_user: root
     become_method: sudo
     roles:
       - vbotka.ansible_runner

.. note::

   ``gather_facts: true`` (3) must be set to gather facts needed to evaluate OS-specific options of
   the role. For example, to install packages the variable ``ansible_os_family`` is needed to select
   the appropriate Ansible module.

.. seealso::

   * For details see `Connection Plugins`_ (4-5)
   * See also `Understanding Privilege Escalation`_ (6-8)

.. _Connection Plugins: https://docs.ansible.com/ansible/latest/plugins/connection.html
.. _Understanding Privilege Escalation: https://docs.ansible.com/ansible/latest/user_guide/become.html#understanding-privilege-escalation
