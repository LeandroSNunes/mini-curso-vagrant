
Exec{ path => [ "/bin/", "/sbin/", "/usr/bin", "/usr/sbin/" ] }

exec { "apt-get-update":
  command => "apt-get update",
}

Exec['apt-get-update'] -> Package <| |>

package { ['vim','git','python-software-properties']:                        
  ensure => installed 
}

# MYSQL
class  { 'mysql::server':
  allow_external_access => true,
}

include mysql::client

mysql::user { 'vagrant':
  password => "12345",
}

# NGINX
exec { 'add-repository-nginx':
  command => 'add-apt-repository ppa:nginx/stable',
  unless  => 'grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep nginx',
}

package { "nginx":
  ensure  => installed,
  require => Exec['add-repository-nginx'],
}

service { "nginx":
  ensure     => running,
  enable     => true,
  hasstatus  => true,
  hasrestart => true,
  require    => Package["nginx"],
}
