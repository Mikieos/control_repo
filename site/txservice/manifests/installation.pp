define txservice::installation (
  $url = 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21'
){
  file { "/opt/${title}":
    ensure => directory,
  }
  file { "/opt/${title}/configurations":
    ensure => directory,
  }
  file { "/opt/${title}/etc":
    ensure => directory,
  }
  file { "/opt/${title}/fscripts":
    ensure => directory,
  }
  file { "/opt/${title}/lib":
    ensure => directory,
  }
  file { "/opt/${title}/fscripts/txservice.sh":
    ensure  => file,
    content => epp('txservice/foreverscript', {
      env => $title
    })
  }
}
