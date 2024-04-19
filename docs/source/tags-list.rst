.. code-block:: bash
   :emphasize-lines: 1,6-7

   shell> ansible-playbook pb.yml --list-tags
   
   playbook: pb.yml

   play #1 (srv.example.com): srv.example.com TAGS: [] TASK TAGS:
      [always, ar_config, ar_debug, ar_links, ar_pip, ar_pkg,
      ar_sanity, ar_vars, ar_venv]
