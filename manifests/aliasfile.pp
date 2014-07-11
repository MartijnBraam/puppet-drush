define aliasfile (
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
