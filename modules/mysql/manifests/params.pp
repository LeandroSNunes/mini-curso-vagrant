class mysql::params {
  $user                      = 'mysql'
  $root_password             = 'root'
  $port                      = 3306
  $bind_address              = '127.0.0.1'
  $bind_address_external     = '0.0.0.0'

  $basedir                   = '/usr'
  $socket                    = '/var/run/mysqld/mysqld.sock'
  $datadir                   = '/var/lib/mysql'
  $log_error                 = '/var/log/mysql/error.log'
  $pid_file                  = '/var/run/mysqld/mysqld.pid'
  $tmpdir                    = '/tmp'
  $lc_messages_dir           = '/usr/share/mysql'

  $nice                      = 0
  $thread_cache_size         = 8
  $expire_logs_days          = 10
  $key_buffer                = '16M'
  $max_allowed_packet        = '16M'
  $max_binlog_size           = '100M'
  $max_connections           = 151
  $myisam_recover            = 'BACKUP'
  $query_cache_limit         = '1M'
  $query_cache_size          = '16M'
  $thread_stack              = '256K'

  $ssl                       = 'false'
  $ssl_ca                    = '/etc/mysql/cacert.pem'
  $ssl_cert                  = '/etc/mysql/server-cert.pem'
  $ssl_key                   = '/etc/mysql/server-key.pem'
}
