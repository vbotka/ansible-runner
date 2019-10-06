# Ansible Runner

[![Build Status](https://travis-ci.org/vbotka/ansible-runner.svg?branch=master)](https://travis-ci.org/vbotka/ansible-runner)

[Ansible role](https://galaxy.ansible.com/vbotka/ansible_runner/). Install and configure *Ansible Runner*.


## Requirements

None.


## Dependencies

None.


## Role Variables

- Review default variables in *defaults/main.yml*
- Review OS specific default varaibles in *vars/defaults/*
- Review examples in *vars/main.yml*
- Put OS specific custom variables into the directory *vars/*
- Review *tasks/vars.yml* to learn about the precedence of the variables


### Variables

- By default the OS specific packages will be installed

```
ar_packages_install: true
```

- By default use *pip* to install *ansible-runner* on **Ubuntu and RH**.

```
ar_pip: true
ar_pkg: false
```

- By default use packages, or ports to install *ansible-runner* on **FreeBSD**.

```
ar_pip: false
ar_pkg: true
```

- Set variable *ar_owner* to the user who will own the installed packages.

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
