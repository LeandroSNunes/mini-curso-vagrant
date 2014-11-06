define mysql::user ($password, $host = "localhost") {
  include mysql::params

  exec { "mysql-new-user-${title}":
    unless  => "mysql -u${title} -p${password}",
    command => "mysql -uroot -p${mysql::params::root_password} -e \"CREATE USER '${title}'@'${host}' IDENTIFIED BY '${password}';\"",
  }
}
