define txservice::installation (
  $server   = '192.168.100.72',
  $port     = 3001,
  $nodeport = 4001,
  $version  = '1.25.0-21'
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
  nginx::resource::server { "${server}:${port}":
    listen_port => $port,
    proxy       => "http://127.0.0.1:${nodeport}",
  }
}
