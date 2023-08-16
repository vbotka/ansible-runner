# Ansible runner

[![quality](https://img.shields.io/ansible/quality/27910)](https://galaxy.ansible.com/vbotka/ansible_runner)[![Build Status](https://app.travis-ci.com/vbotka/ansible-runner.svg?branch=master)](https://app.travis-ci.com/github/vbotka/ansible-runner)[![Documentation Status](https://readthedocs.org/projects/docs/badge/?version=latest)](https://ansible-runner-role.readthedocs.io/en/latest/)

[Ansible role](https://galaxy.ansible.com/vbotka/ansible_runner/). Install and configure [Ansible Runner](https://github.com/ansible/ansible-runner).

[Documentation at readthedocs.io](https://ansible-runner-role.readthedocs.io)

Feel free to [share your feedback and report issues](https://github.com/vbotka/ansible-runner/issues).

[Contributions are welcome](https://github.com/firstcontributions/first-contributions).


## Supported platforms

This role has been developed and tested with
* [Ubuntu Supported Releases](http://releases.ubuntu.com/)
* [FreeBSD Supported Production Releases](https://www.freebsd.org/releases/)

This may be different from the platforms in Ansible Galaxy which does not offer all
released versions in time and would report an error. For example:
`IMPORTER101: Invalid platform: "FreeBSD-13.2", skipping.`


## Requirements and dependencies

### Roles

* vbotka.ansible_lib

### Collections

* community.general


## Role Variables

- See default variables in *defaults/main.yml*
- See OS specific default varaibles in *vars/defaults/*
- See examples in *vars/main.yml.samples*
- Put OS specific custom variables into the directory *vars/*
- See the precedence of the variables in */tasks/vars.yml*


### Variables

- See *tasks/packages.yml*. The OS specific packages will be installed if you set

```
ar_pkg_install: true
ar_pip_install: false
```

- See *tasks/pip.yml*. Instead, you can use *pip* to install *ansible-runner* on LInux if you set

```
ar_pkg_install: false
ar_pip_install: true
```

- When installing by pip, set variable *ar_owner* to the user who will own the packages installed by pip

```
ar_owner: admin
```

When undefined, the variable *ar_owner* will be set to *ansible_user_id* if defined. The existence of the variable *ar_owner* is tested by sanity.

```
ar_owner: "{{ ansible_user_id }}"
```

The *pip* installation task will run

```
become_user: "{{ ar_owner }}"
become: true
pip:
  name: ...
```

### WARNING: Do not manage system site-packages with pip

By default the pip arguments are set

```yaml
ar_pip_extraagrs: '--user --upgrade'
```

See [Conclusions. The pip module isn't always idempotent #28952](https://github.com/ansible/ansible/issues/28952):

  Managing system site-packages with Pip is not a good idea and will
  probably break your OS. Those should be solely managed by the OS
  package manager (apt/yum/dnf/etc.). If you want to manage env for
  some software in Python, better use a virtualenv technology.


## Examples

1) [Repeat play until succeeds](https://github.com/vbotka/ansible-runner/blob/master/contrib/repeat_play_until_succeeds.bash)


## References

- [Ansible Runner - readthedoc](https://ansible-runner.readthedocs.io/en/latest/)
- [Ansible Runner - github](https://github.com/ansible/ansible-runner/)


## License

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)


## Author Information

[Vladimir Botka](https://botka.info)
