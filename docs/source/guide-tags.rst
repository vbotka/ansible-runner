Tags
****

The tags provide the user with a very useful tool to run selected tasks of the role. To see what
tags are available list the tags of the role:

.. include:: tags-list.rst

For example, display the list of the variables and their values with the tag ``ar_debug`` (when the
debug is enabled ``ar_debug=true``) ::

  shell> ansible-playbook pb.yml -t ar_debug -e ar_debug=true

See what OS packages will be installed ::

  shell> ansible-playbook pb.yml -t ar_pkg --check

Install OS packages and exit the play ::

  shell> ansible-playbook pb.yml -t ar_pkg
