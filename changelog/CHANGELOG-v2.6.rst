=======================================
vbotka.ansible_runner 2.6 Release Notes
=======================================

.. contents:: Topics


2.6.6
=====

Release Summary
---------------
Bugfix release with updated docs.

Major Changes
-------------

Minor Changes
-------------


2.6.5
=====

Release Summary
---------------
Bugfix and maintenance release with updated docs.

Major Changes
-------------

Minor Changes
-------------
* Fix README tag badge.
* Fix README label.
* Exclude docs from local ansible-lint
* Use default rules in local ansible-lint config.
* Update skip_list in local ansible-lint config.
* Update docs.


2.6.4
=====

Release Summary
---------------
Support FreeBSD 13.3 and 14.0. Support Python vritual environment.

Major Changes
-------------
* Support FreeBSD 13.3 and 14.0
* Add tasks venv.yml. Support Python vritual environment.

Minor Changes
-------------
* Update README
* Update docs
* travis.yml formatting
* Update vars/defaults

Breaking Changes / Porting Guide
--------------------------------
* Variables ar_packages and ar_pip_packages changed from a list to a
  list of dictionaries.
* Add variables ar_packages_state and ar_pip_packages_state
* Tasks packages.yml renamed to pkg.yml
* Tag ma_packages renmed to ma_pkg


2.6.3
=====

Release Summary
---------------
Update docs.


2.6.2
=====

Release Summary
---------------
Fix Ansible lint.

Major Changes
-------------
* Add Ubuntu-jammy.yml, Ubuntu-lunar.yml, Ubuntu-mantic.yml, and
  Ubuntu-noble.yml to vars/defaults

Minor Changes
-------------
* Update tests.
* Add .ansible-lint.local


2.6.1
=====

Release Summary
---------------
Update docs. Improve work-flow.

Major Changes
-------------
* Run sanity.yml before packages.yml

Minor Changes
-------------
* Bump 2.6.1
* Update comments in defaults
* Update docs requirements readthedocs-sphinx-search==0.3.2

2.6.0
=====

Release Summary
---------------
Ansible 2.16 update

Major Changes
-------------

Minor Changes
-------------
* Update docs
* Update README
