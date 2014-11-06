class mysql::server (
  $allow_external_access = false,
){ 
  include mysql::params
  include mysql::dependencies

  package { "mysql-server":
    ensure  => installed,
    require => Class['mysql::dependencies'],
  } ->
  service { "mysql":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  file { '/etc/mysql/my.cnf':
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('mysql/my.cnf.erb'),
    require => Package["mysql-server"],
    notify  => Service["mysql"],
  }

  exec { "change-user-password":
    unless  => "mysql -uroot -p${mysql::params::root_password}",
    command => "mysqladmin -uroot password ${mysql::params::root_password}",
    require => Service['mysql'],
  }


}
