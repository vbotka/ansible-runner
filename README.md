# ansible runner

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
`IMPORTER101: Invalid platform: "FreeBSD-11.3", skipping.`


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

- By default the OS specific packages will be installed

```
ar_install: true
```

- By default use *pip* to install *ansible-runner* on Ubuntu and RH

```
ar_pip_install: true
```

- Use packages, or ports to install *ansible-runner* on FreeBSD

```
ar_pip_install: false
```

- Set variable *ar_owner* to the user who will own the packages installed by pip

```
ar_owner: admin
```

By default

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

See *tasks/packages.yml*


## Examples

1) [Repeat play until succeeds](https://github.com/vbotka/ansible-runner/blob/master/contrib/repeat_play_until_succeeds.bash)


## References

- [Ansible Runner - readthedoc](https://ansible-runner.readthedocs.io/en/latest/)
- [Ansible Runner - github](https://github.com/ansible/ansible-runner/)


## License

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)


## Author Information

[Vladimir Botka](https://botka.link)
