class mysql::dependencies {
  if ! defined(Package['libmysqlclient-dev']) { package { 'libmysqlclient-dev': ensure => installed } }
  if ! defined(Package['libmysqld-dev'])      { package { 'libmysqld-dev':      ensure => installed } }
  if ! defined(Package['libmysql-ruby'])      { package { 'libmysql-ruby':      ensure => installed } }
  if ! defined(Package['ruby-mysql'])         { package { 'ruby-mysql':         ensure => installed } }
}
