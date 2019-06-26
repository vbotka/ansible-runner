Ansible Lint
============

[![Build Status](https://travis-ci.org/vbotka/ansible-ansible_runner.svg?branch=master)](https://travis-ci.org/vbotka/ansible-ansible_runner)

[Ansible role](https://galaxy.ansible.com/vbotka/ansible_runner/). Install and configure *Ansible Runner*.


Requirements
------------

None.


Role Variables
--------------

To install OS specific packages set

```
ar_packages_install: true
```

Put OS specific custom variables into the directory /vars. Review /tasks/vars.yml to learn the precedence of the variables.

(TBD). Review the defaults and examples in vars.


Dependencies
------------

None.


References
----------

- [Ansible Runner - readthedoc](https://ansible-runner.readthedocs.io/en/latest/)
- [Ansible Runner - github](https://github.com/ansible/ansible-runner/)


License
-------

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)



Author Information
------------------

[Vladimir Botka](https://botka.link)
