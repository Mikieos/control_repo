class profile::base {
  user { 'admin':
    ensure => present,
  }
  inlcude profile::ssh_server
}
