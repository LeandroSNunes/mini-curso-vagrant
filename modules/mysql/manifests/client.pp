class mysql::client {
  include mysql::params
  include mysql::dependencies

  package { "mysql-client":
    ensure  => installed,
    require => Class['mysql::dependencies'],
  }

}
