Debug
*****

To see additional debug information enable debug output in the configuration ::

  ar_debug: true

, or set the extra variable in the command ::

  shell> ansible-playbook pb.yml -e ar_debug=true

.. hint::

   The debug output of this role is optimized for ``result_format=yaml``. See `result_format`_. Set
   it in the configuration

   .. code:: ini

      [defaults]
      callback_result_format = yaml

   , or in the environment

   .. code:: bash

      ANSIBLE_CALLBACK_RESULT_FORMAT=yaml

.. seealso::

   * `Playbook Debugger`_

.. _result_format: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/default_callback.html#parameter-result_format
.. _Playbook Debugger: https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html
