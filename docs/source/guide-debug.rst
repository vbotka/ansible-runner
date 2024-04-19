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

   shell> ansible-playbook pb.yml -e ar_debug=true

.. note::

   * The debug output of this role is optimized for the **yaml**
     callback plugin. For example, set this plugin in the environment
     ``shell> export ANSIBLE_STDOUT_CALLBACK=yaml``.

   * See details about the yaml callback plugin ``shell> ansible-doc -t callback yaml``

   * See list of other callback plugins ``shell> ansible-doc -t callback -l``


.. seealso::

   * `Playbook Debugger <https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html>`_
