define txservice::installation (
  $server   = '192.168.100.72',
  $port     = 3001,
  $nodeport = 4001,
  $version  = '1.25.0-21',
  $config   = lookup('config', {merge => hash, default_value => []})
){
  info("installation started")
  info("Config contents ${config}.")
  info("my transics domain: ${config["mytransics"]["domain"]}");
  info("my transics domain: ${config["redis"]["endpoints"]}");
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
    mode    => '755',
    content => epp('txservice/foreverscript', {
      env => $title
    })
  }
  file { "/var/log/forever/${title}":
    ensure => directory,
  }
  file { "/var/log/forever/${title}/forever.log":
    ensure  => file,
  }
  file { "/opt/${title}/configurations/config.json":
    ensure => file,
    # source => template('txservice/tx-service.config.json.erb', { config => $config});
  }
  info("installing TX-Service")
  exec {"install txservice ${title}":
    command => "/opt/${title}/fscripts/txservice.sh install ${version}",
    require => [File["/opt/${title}/fscripts/txservice.sh"]],
  }
  info("TX-Serivce Installed")
  nginx::resource::server { "${server}:${port}":
    listen_port => $port,
    proxy	=> "http://127.0.0.1:${nodeport}",
  }
}
