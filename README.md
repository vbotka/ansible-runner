# Ansible Runner

[![Build Status](https://travis-ci.org/vbotka/ansible-runner.svg?branch=master)](https://travis-ci.org/vbotka/ansible-runner)

[Ansible role](https://galaxy.ansible.com/vbotka/ansible_runner/). Install and configure *Ansible Runner*.


## Requirements

None.


## Role Variables

To install OS specific packages set

```
ar_packages_install: true
```

Put OS specific custom variables into the directory /vars. Review
/tasks/vars.yml to learn the precedence of the variables.

(TBD). Review the defaults and examples in vars.


## Dependencies

None.


## Ubuntu

This role uses *pip* to install *ansible-runner* on Ubuntu. Set
variable *ar_owner* to the user who will own the installed package.

```
ar_owner: admin
```

By default

```
ar_owner: "{{ ansible_user }}"
```

The installation task will run

```
become_user: "{{ ar_owner }}"
```

Review *tasks/packages.yml* 


## References

- [Ansible Runner - readthedoc](https://ansible-runner.readthedocs.io/en/latest/)
- [Ansible Runner - github](https://github.com/ansible/ansible-runner/)


## License

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)



## Author Information

[Vladimir Botka](https://botka.link)
