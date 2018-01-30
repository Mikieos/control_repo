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
  file { "/var/log/forever/${title}/forever.log": 
    mode => 755,
  }
  exec {"install txservice ${title}":
    command => "/opt/${title}/fscripts/txservice.sh update ${version}",
    require => [File["/opt/${title}/fscripts/txservice.sh"]],
  }
  exec {"start txservice ${title}":
    command => "/opt/${title}/fscripts/txservice.sh start",
  }
  nginx::resource::server { "${server}:${port}":
    listen_port => $port,
    proxy       => "http://127.0.0.1:${nodeport}",
  }
}
