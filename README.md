# ansible_runner

[![quality](https://img.shields.io/ansible/quality/27910)](https://galaxy.ansible.com/vbotka/ansible_runner)
[![Build Status](https://app.travis-ci.com/vbotka/ansible-runner.svg?branch=master)](https://app.travis-ci.com/github/vbotka/ansible-runner)
[![Documentation Status](https://readthedocs.org/projects/ansible-runner-role/badge/?version=latest)](https://ansible-runner-role.readthedocs.io/en/latest/?badge=latest)
[![GitHub tag](https://img.shields.io/github/v/tag/vbotka/ansible-runner)](https://github.com/vbotka/ansible-runner/tags)

[Ansible role](https://galaxy.ansible.com/vbotka/ansible_runner/). Install and configure [Ansible Runner](https://github.com/ansible/ansible-runner).

[Documentation at readthedocs.io](https://ansible-runner-role.readthedocs.io)

Feel free to [share your feedback and report issues](https://github.com/vbotka/ansible-runner/issues).

[Contributions are welcome](https://github.com/firstcontributions/first-contributions).


## Supported platforms

This role has been developed and tested with
* [Ubuntu Supported Releases](http://releases.ubuntu.com/)
* [FreeBSD Supported Production Releases](https://www.freebsd.org/releases/)


## Requirements and dependencies

### Roles

* vbotka.ansible_lib

### Collections

* community.general


## Role Variables

- See default variables in *defaults/main.yml*
- See OS specific default variables in *vars/defaults/*
- See examples in *vars/main.yml.samples*
- Put OS specific custom variables into the directory *vars/*
- See the precedence of the variables in */tasks/vars.yml*


### Variables

* See *tasks/pkg.yml*. The OS specific packages will be installed
  if you set

```yaml
ar_pkg_install: true
ar_pip_install: false
ar_venv_install: false
```

* See *tasks/pip.yml*. Instead, you can use *pip* to install
  *ansible-runner*

```yaml
ar_pkg_install: false
ar_pip_install: true
ar_venv_install: false
```

* When installing by pip, set variable *ar_owner* to the user who will
  own the packages. For example,

```yaml
ar_owner: admin
```

When undefined, not escalated *setup* (become=false) will gather
subset *user* and the variable *ar_owner* will be set. See
tasks/vars.yml

```yaml
ar_owner: "{{ ansible_user | default(ansible_user_id) }}"
```

The *pip* installation task will run

```yaml
become_user: "{{ ar_owner }}"
become: true
pip:
  name: ...
```

### WARNING: Do not manage system site-packages with pip

By default the pip arguments are set

```yaml
ar_pip_extraagrs: --user --upgrade
```

See [Conclusions. The pip module isn't always idempotent #28952](https://github.com/ansible/ansible/issues/28952):

  Managing system site-packages with Pip is not a good idea and will
  probably break your OS. Those should be solely managed by the OS
  package manager (apt/yum/dnf/etc.). If you want to manage env for
  some software in Python, better use a virtualenv technology.

* See *tasks/venv.yml*. Optionally, you can use *pip* to install
  *ansible-runner* in Python virtual environment

```yaml
ar_pkg_install: false
ar_pip_install: false
ar_venv_install: true
```


### Ansible lint

Use the configuration file *.ansible-lint.local* when running
*ansible-lint*. Some rules might be disabled and some warnings might
be ignored. See the notes in the configuration file.

```bash
shell> ansible-lint -c .ansible-lint.local
```


## Examples

1) [Repeat play until succeeds](https://github.com/vbotka/ansible-runner/blob/master/contrib/repeat_play_until_succeeds.bash)


## References

- [Ansible Runner - readthedoc](https://ansible-runner.readthedocs.io/en/latest/)
- [GitHub ansible/ansible-runner](https://github.com/ansible/ansible-runner)
- [Python virtual environments for Ansible](https://www.redhat.com/sysadmin/python-venv-ansible)


### Issues

- [ANSIBLE_CALLBACK_PLUGINS in envvars is not working. #219](https://github.com/ansible/ansible-runner/issues/219)


## License

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)


## Author Information

[Vladimir Botka](https://botka.info)
