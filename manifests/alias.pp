define drush::alias(
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
