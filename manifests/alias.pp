define alias (
  $filename = $title,
  $owner    = 'root',
  $group    = 'root',
  $mode     = '0644',
  ){

  concat{ $filename:
    mode   => $mode,
    owner  => $owner,
    group  => $group,
  }

  concat::fragment { 'aliasfile_header_${filename}':
    target   => $filename,
    content  => "<?php\n\n",
    order    => "01",
  }

}

define alias::define(
  $alias         = $name,
  $aliasfile     = "",
  $url           = "",
  $root          = "/",
  $database_host = "localhost",
  $database_name = "drupal",
  $database_user = "root",
  $database_pass = "root",
  $database_port = "3306",
  $database_prefix = "",
) {

  concat::fragment{ "alias_${alias}_${aliasfile}":
    target => $aliasfile,
    content => template("drush/alias.erb"),
    order  => "02",
  }

}
