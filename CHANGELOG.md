
Current
-------

0.0.6 (2017-10-21)
-----------------

Nil City do longer crashes.
Spell capitalize correctly.
Upgrade rr, guard, guard-minitest

0.0.5 (2016-12-7)
-----------------

Fix bug where "".trim was called instead of "".strip

0.0.4 (2016-12-7)
-----------------

Upgrade to StreetAddres 1.0.6 (2.0 has not been released)

Remove trailing 'United States' or 'USA'


0.0.3 (2014-02-24)
------------------

Bugs
====

- Removed Suffix Street modification
- Address.street no longer contains suffix

Features
========

- to_s places suffix after street


0.0.2 (2014-02-02)
------------------

Breaking Changes
================

- parse normalizes address

0.0.1
-----

Features
========

- normalize
  - Removes state
  - Removes postal code
  - Capitializes city, street
  - Suffix comes after street ([this](https://github.com/derrek/street-address/issues/9))
  - Removes period from prefix

