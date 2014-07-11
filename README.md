drush

This is the drush module.

Usage
-------

To just install drush in `/opt/drush`

    include drush

Specify installation directory

    class { 'drush':
      install_dir  => '/usr/share/drush',
    }

All options:

- **install_dir** /opt/drush
  Set installation directory for drush
- **repository** https://github.com/drush-ops/drush.git
  The repository to clone from
- **ref** master
  The git ref to clone
- **php_package** php5-cli
  This package is installed for drush


Support
-------

Please log tickets and issues at the [issue tracker](https://github.com/MartijnBraam/puppet-drush/issues)
