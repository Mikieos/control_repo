class profile::web {
  include nginx
  
  class { 'nodejs':
    repo_url_suffix       => '6.x',
  }
  
  package { 'forever':
    ensure   => 'present',
    provider => 'npm',
  }
  
  class {'profile::txservice':
    env => 'FB01',
    url => 'http://dev.mytransics.com/npm/package/tx-service/1.25.0-21'
  }
}
