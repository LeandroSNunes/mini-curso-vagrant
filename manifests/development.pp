
Exec{ path => [ "/bin/", "/sbin/", "/usr/bin", "/usr/sbin/" ] }

exec { "apt-get-update":
  command => "apt-get update",
}

Exec['apt-get-update'] -> Package <| |>


package { ['git','python-software-properties']:                        
  ensure => installed 
}

# MYSQL
class  { 'mysql::server':
  allow_external_access => true,
}

include mysql::client

mysql::user { 'vagrant':
  password => "12345",
  require  => Class['mysql::client'],
}
