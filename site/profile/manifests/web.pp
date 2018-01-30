class profile::web {
  include txservice
  
  txservice::installation {'DS01':
    env     => 'DS01',
    url     => 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21',
  }
  
  txservice::installation {'DS02':
    env     => 'DS02',
    url     => 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21',
  }
}
