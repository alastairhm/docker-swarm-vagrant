class docker {

  exec { 'apt-key add':
    command => '/usr/bin/apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D',
  } 

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    require => [File['/etc/apt/sources.list.d/docker.list'],Exec['apt-key add']],
  } 

  exec { 'apt-get install':
    command => '/usr/bin/apt-get install apt-transport-https ca-certificates',
    require => Exec["apt-get update"],
  } 

  file { '/etc/apt/sources.list.d/docker.list':
    ensure  => present, 
    content => 'deb https://apt.dockerproject.org/repo ubuntu-trusty main'
  }

  exec { 'docker install':
    command => '/usr/bin/curl -sSL https://get.docker.com/ | sh',
  } ->
  exec { 'user add':
    command => '/usr/sbin/usermod -aG docker vagrant',
  } ->
  service { 'docker':
    ensure => false,
  } ->
  exec { 'docker start':
    command => '/usr/bin/nohup /usr/bin/docker daemon -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock &',
  }

}
