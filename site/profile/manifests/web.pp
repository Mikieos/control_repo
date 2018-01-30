class profile::web {
  include txservice
  
  txservice::installation {'DS01':
    server    => '192.168.100.72',
    port      => 3001,
    nodeport  => 4001,
    version   => '1.25.0-21',
  }
  
  txservice::installation {'DS02':
    server    => '192.168.100.72',
    port      => 3002,
    nodeport  => 4002,
    version   => '1.25.0-21',
  }
  
  txservice::installation {'DS03':
    server    => '192.168.100.72',
    port      => 3003,
    nodeport  => 4003,
    version   => '1.25.0-21',
  }
}
