class docker {

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
  } ->

  exec { 'apt-get install':
    command => '/usr/bin/apt-get install apt-transport-https ca-certificates',
  } ->

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
