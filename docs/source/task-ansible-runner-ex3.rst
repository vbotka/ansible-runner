Example 3: Run Ansible playbooks in cron
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``ssh-agent`` is needed to provide the ssh connection plugin with the
password to the private key, when used. The script below is executed
by the command interpreter for login shells

.. code-block:: sh
   :linenos:
   :emphasize-lines: 1

   cntrlr> cat /home/admin/.profile
   if [ -n "$BASH_VERSION" ]; then
       if [ -f "$HOME/.bashrc" ]; then
          . "$HOME/.bashrc"
       fi
       if [ -f "$HOME/.bashrc_ssh" ]; then
          . "$HOME/.bashrc_ssh"
       fi
   fi
   if [ -d "$HOME/bin" ] ; then
       PATH="$HOME/bin:$PATH"
   fi


and wiill start ``ssh-agent`` on login and prepare *SSH_ENV* (5)

.. code-block:: sh
   :linenos:
   :emphasize-lines: 1

   cntrlr> cat /home/admin/.bashrc_ssh
   SSH_ENV="$HOME/.ssh/environment"
   function start_agent {
       echo "Initialising new SSH agent..."
       /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
       echo succeeded
       chmod 600 "${SSH_ENV}"
       . "${SSH_ENV}" > /dev/null
       /usr/bin/ssh-add;
   }
   if [ -f "${SSH_ENV}" ]; then
       . "${SSH_ENV}" > /dev/null
       #ps ${SSH_AGENT_PID} doesn't work under cywgin
       ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
           start_agent;
       }
   else
       start_agent;
   fi


Example of *.ssh/environment* created by *ssh-agent*

.. code-block:: sh
   :emphasize-lines: 1

   cntrlr> cat /home/admin/.ssh/environment 
   SSH_AUTH_SOCK=/tmp/ssh-8fUkZ7qOzVPs/agent.5214; export SSH_AUTH_SOCK;
   SSH_AGENT_PID=5216; export SSH_AGENT_PID;
   #echo Agent pid 5216;


.. seealso::
   * `Start ssh-agent on login <https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login>`_


Wrapper of *ansible-runner* will source *.ssh/environment* (9) and run
the *playbook* from the *project* (10)

.. code-block:: sh
   :linenos:
   :emphasize-lines: 1

   cntrlr> cat /home/admin/bin/arwrapper.sh
   #!/bin/bash
   runner=$HOME/bin/ansible-runner
   project=$HOME/.ansible/runner/$2
   playbook=${3:-all.yml}
   case "$1" in
       run)
          echo $(date '+%Y-%m-%d %H:%M:%S') $0
          source $HOME/.ssh/environment
          $runner run $project -p $playbook
          exit 0
          ;;
       clean)
          rm -rf $project/artifacts
          exit 0
          ;;
       *)
          printf "$0: run|clean project [playbook]\n"
          exit 1
          ;;
   esac


The script below will use *arwrapper.sh* (9) to run the playbook
*pb-01.yml* (7) in the projects *test_01, test_02,* and *test_03*
(6). If the command (9) succeeds the script will print *[OK]* report
(14). If you don't want to receive email on success remove this line
and optionally enable the cleaning of the artifacts (13)

.. code-block:: sh
   :linenos:
   :emphasize-lines: 1

   cntrlr> cat /home/admin/bin/ansible-cron-test.sh
   #!/bin/bash
   marker=$(printf "%75s" | sed "s/ /./g")
   rc=0
   cmd=$HOME/bin/arwrapper.sh
   projects="test_01 test_02 test_03"
   playbook=pb-01.yml
   for project in ${projects[@]}; do
       if ! out=$($cmd run $project $playbook); then
           rc=1
           printf "[ERR] $out\n$marker\n"
       else
           # $cmd clean $project
           printf "[OK]  $project $playbook PASSED\n"
       fi
   done
   exit $rc


Schedule the script in *cron*

.. code-block:: sh
   :emphasize-lines: 1,3

   cntrlr> whoami
   admin
   cntrlr> crontab -l
   MAILTO=admin
   #Ansible: Ansible runner daily test
   50 20 * * * $HOME/bin/ansible-cron-test.sh


In our case the */etc/aliases* redirect the emails for *root* to the
user *admin*. Cron will report the result of the scpript
*ansible-cron-test.sh*. If you want to receive email on a failure only
remove the *[OK]* report from the script and optionally clean the
*artifacts*. The *artifacts* will be available for a review if the
script fails
      
.. code-block:: sh
   :emphasize-lines: 1

   Date: Tue,  7 Jul 2020 20:50:06 +0200 (CEST)
   From: Cron Daemon <root@cntrlr.example.com>
   To: admin@cntrlr.example.com
   Subject: Cron <admin@cntrlr> $HOME/bin/ansible-cron-test.sh

   [OK]  test_01 pb-01.yml PASSED
   [OK]  test_02 pb-01.yml PASSED
   [OK]  test_03 pb-01.yml PASSED


Example of the project's directory without the artifacts. The
artifacts will be created by *ansible-runner*

.. code-block:: sh
   :emphasize-lines: 1

   cntrlr> tree /home/vlado/.ansible/runner/test_01
   /home/admin/.ansible/runner/test_01
   ├── env
   ├── inventory
   │   └── hosts
   └── project
       ├── ansible.cfg
       ├── group_vars
       ├── host_vars
       └── pb-01.yml


.. seealso::
   * `Runner Input Directory Hierarchy <https://ansible-runner.readthedocs.io/en/latest/intro.html#runner-input-directory-hierarchy>`_
   * Example playbook how to create projects `pb-create-runner-private.yml <https://github.com/vbotka/ansible-ansible/blob/master/contrib/workbench/pb-create-runner-private.yml>`_


Example of the project's artifacts

.. code-block:: sh
   :emphasize-lines: 1

   cntrl> tree /home/admin/.ansible/runner/test_01/artifacts/
   /home/admin/.ansible/runner/test_01/artifacts
   └── aaa5d36e-e8d4-432a-ab52-b69062c85311
       ├── command
       ├── fact_cache
       ├── job_events
       │   ├── 1-2b5c9412-f0c4-45dc-a425-5c8c29e37ec0.json
       │   ├── 2-5ce0c5a2-1f02-cdab-8869-00000000001f.json
       │   ├── 3-5ce0c5a2-1f02-cdab-8869-000000000021.json
       │   ├── 4-28749e27-409a-46c4-9551-7ce80c02be83.json
       │   ├── 5-997d90c1-6357-45c6-8df9-437c2940c74e.json
       │   └── 6-6e41cf27-8c1e-4266-9ffb-8a54375bd4cc.json
       ├── rc
       ├── status
       └── stdout


.. seealso::
   * `Runner Artifacts Directory Hierarchy <https://ansible-runner.readthedocs.io/en/latest/intro.html#runner-artifacts-directory-hierarchy>`_
   * `ansible_lib: al_runner_events <https://github.com/vbotka/ansible-lib/blob/master/tasks/al_runner_events.yml>`_


Example of a playbook used in the test

.. code-block:: sh
   :emphasize-lines: 1

   cntrlr> cat /home/admin/.ansible/runner/test_01/project/pb-01.yml 
   - hosts: test_01
     remote_user: admin
     gather_facts: no
     tasks:
       - debug:
           msg: TEST
