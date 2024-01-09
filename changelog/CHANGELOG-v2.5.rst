=======================================
vbotka.ansible_runner 2.5 Release Notes
=======================================

.. contents:: Topics


2.5.4
=====

Release Summary
---------------
Ansible 2.15 update. Add FreeBSD 14.0. Add Ubuntu lunar and mantic.

Major Changes
-------------
* The variable ar_packages changed to a plain list.
* Update tasks/packages.yml
* Update tasks/pip.yml; Muted pip always reporting changed in check
  mode.
* Sanity checking ar_owner and ar_pip_executable limited to
  ar_pip_install
* Update tasks/vars.yml; Robust defaults of ar_owner
* Update vars/defaults; Set ar_packages according ar_pip_install

Minor Changes
-------------
* Update docs
* Update README
* Update contrib
* Update defaults retries/delay to 10/3
* Update debug formatting. Add new variables.

Bugfixes
--------
* Fix ar_pip_requirements is path to a pip requirements file.

Breaking Changes / Porting Guide
--------------------------------
* Change the structure of ar_packages to a plain list.


2.5.3
=====

Release Summary
---------------
Add changelog. Add docs/requirements.txt

Major Changes
-------------

Minor Changes
-------------

Bugfixes
--------

Breaking Changes / Porting Guide
--------------------------------
