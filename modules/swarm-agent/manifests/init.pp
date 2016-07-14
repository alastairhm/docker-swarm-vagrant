class swarm-agent {
    require docker

    $address = $ipaddress_eth1
    $discovery = hiera('discovery')
    $manager   = hiera('manager')
    $secret    = hiera('secret')

    exec { 'swarm join':
	command => "/usr/bin/docker swarm join --secret $secret $manager",
    }

}
