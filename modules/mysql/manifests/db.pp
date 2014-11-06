define mysql::db ($user, $password){

  include mysql::params

  exec { "privileges-${title}":
    unless  => "mysql -u${user} -p${password} -e \"SHOW GRANTS FOR '${user}'@'localhost';\" | grep ${title}",
    command => "mysql -uroot -p${mysql::params::root_password} -e \"GRANT ALL PRIVILEGES ON ${title}.* TO '${user}'@'localhost';\"",
    require => Class['mysql::server'],
  } ->
  exec { "${title}-schema":
    unless  => "mysql -u${user} -p${password} ${title}",
    command => "mysqladmin -u${user} -p${password} create ${title}",
   }

}
