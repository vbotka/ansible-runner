# ansible runner

[![Build Status](https://travis-ci.org/vbotka/ansible-runner.svg?branch=master)](https://travis-ci.org/vbotka/ansible-runner)[![Documentation Status](https://readthedocs.org/projects/docs/badge/?version=latest)](https://ansible-runner-role.readthedocs.io/en/latest/)

[Ansible role](https://galaxy.ansible.com/vbotka/ansible_runner/). Install and configure [Ansible Runner](https://github.com/ansible/ansible-runner).


[Documentation at readthedocs.io](https://ansible-runner-role.readthedocs.io) [[PDF 155k](https://github.com/vbotka/ansible-runner/blob/master/ansible-runner-role.pdf)]

Feel free to [share your feedback and report issues](https://github.com/vbotka/ansible-runner/issues). Contributions are welcome.


## Supported platforms

This role has been developed and tested with
* [Ubuntu Supported Releases](http://releases.ubuntu.com/)
* [FreeBSD Supported Production Releases](https://www.freebsd.org/releases/)

This may be different from the platforms in Ansible Galaxy which does not offer all
released versions in time and would report an error. For example:
`IMPORTER101: Invalid platform: "FreeBSD-11.3", skipping.`


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
ar_install: true
```

- By default use *pip* to install *ansible-runner* on Ubuntu and RH.

```
ar_pip_install: true
```

- By default use packages, or ports to install *ansible-runner* on FreeBSD.

```
ar_pip_install: false
```

- Set variable *ar_owner* to the user who will own the packages installed by pip.

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

Review *tasks/packages.yml*


## Examples

1) [Repeat play until succeeds](https://github.com/vbotka/ansible-runner/blob/master/contrib/repeat_play_until_succeeds.bash)


## References

- [Ansible Runner - readthedoc](https://ansible-runner.readthedocs.io/en/latest/)
- [Ansible Runner - github](https://github.com/ansible/ansible-runner/)


## License

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)


## Author Information

[Vladimir Botka](https://botka.link)
