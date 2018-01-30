class profile::web {
  include txservice
  
  txservice::installation {'DS01':
    url     => 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21',
  }
  
  txservice::installation {'DS02':
    url     => 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21',
  }
  
  txservice::installation {'DS03':
    url     => 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21',
  }
}
