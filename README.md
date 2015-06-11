# test_vgrup
Overview
--------
*Temporary* repo for vagrant experiments.
Target
------
Askbot app in Vagrant development environment.

Flow
----
0. Clone repo

1. Boot virtual box via vagrant:
```
$ vagrant up
```
Takes about 300-500s.

2. Run custom install script for Askbot:
```
$ /vagrant/askbot-init-custom.sh
```
Status: Incomplete
--------------------
- App won't launch in virtual environment (syncdb error?)
- uWSGI not fully configured

