class txservice (

){
  include nginx

  class { 'nodejs':
    repo_url_suffix       => '6.x',
  }

  package { 'forever':
    ensure   => 'present',
    provider => 'npm',
  }
}
