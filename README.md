puppet-drush
============

This is the drush module.

Usage
-----

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

Aliases
-------

To create a drush alias file for the root user:

    drush::aliasfile{ "/root/.drush/test.aliases.drushrc.php"
      mode = "0600"
    }

    drush::alias{ "site1":
      aliasfile => "/root/.drush/test.aliases.drushrc.php",
      root      => "/var/www/drupal8",
      url       => "http://drupal8.dev",
      database_user => "drupal",
      database_pass => "jf8AA82#3a(BF",
      database_name => "drupal"
    }

    drush::alias{ "site2":
      aliasfile => "/root/.drush/test.aliases.drushrc.php",
      root      => "/var/www/test",
      url       => "http://test.dev",
      database_user => "drupal",
      database_pass => "abcdef",
      database_name => "test",
      database_prefix => "test",
    }


Support
-------

Please log tickets and issues at the [issue tracker](https://github.com/MartijnBraam/puppet-drush/issues)
