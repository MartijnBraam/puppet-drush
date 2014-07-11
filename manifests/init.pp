# == Class: drush
#
# This class installs drush
#
# === Parameters
#
# Document parameters here.
#
# [*install_dir*]
#   The directory to install drush into (the repository is cloned in here)
#
# [*repository*]
#   The repository to clone (the drush-ops/drush repository by default)
#
# [*ref*]
#   The git ref to clone (the master branch by default)
#
# [*php_package*]
#   The php package that is installed
#
#
# === Examples
#
#  class { drush:
#    install_dir => "/opt/drush"
#  }
#
# === Authors
#
# Martijn Braam <martijn@brixit.nl>
#
# === Copyright
#
# Copyright 2014 Martijn Braam
#
class drush (
    $install_dir    = $drush::params::install_dir,
    $repository     = $drush::params::repository,
    $ref            = $drush::params::ref,
    $php_package    = $drush::params::php_package,
) inherits ::drush::params{

    vcsrepo { $install_dir:
        ensure      => present,
        provider    => git,
        source      => $repository,
        revision    => $ref,
        require     => Package[$php_package],
    }

    file { "/usr/local/bin/drush":
        ensure => "link",
        target => "${install_dir}/drush",
        require => vcsrepo[$install_dir],
    }

    if defined(Package[$php_package]) == false {
        package { $php_package: ensure => present, }
    }

    include composer

    exec { "drush_composer_install":
        cwd         => $install_dir,
        tries       => 2,
        path        => "/bin:/usr/bin:/usr/local/bin",
        command     => "sh -c 'composer install'",
        creates     => "${install_dir}/vendor",
        require     => vcsrepo[$install_dir],
    }
}
