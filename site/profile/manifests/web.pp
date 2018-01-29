class profile::web {
  include nginx
  
  class { 'nodejs':
    repo_url_suffix       => '6.x',
    manage_package_repo       => false,
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
  }

  package { 'forever':
    ensure   => 'present',
    provider => 'npm',
  }
}
