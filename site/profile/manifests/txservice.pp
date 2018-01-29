class profile::txservice (
  $env = 'DS01',
  $url = 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21'
){
  file { "/opt/${env}":
    ensure => directory,
  }
  file { "/opt/${env}/configurations":
    ensure => directory,
  }
  file { "/opt/${env}/etc":
    ensure => directory,
  }
  file { "/opt/${env}/fscripts":
    ensure => directory,
  }
  file { "/opt/${env}/lib":
    ensure => directory,
  }
  file { "/opt/${env}/fscripts/txservice.sh":
    ensure  => file,
    content => epp('profile/foreverscript', {
      env => $env
    })
  }
}
