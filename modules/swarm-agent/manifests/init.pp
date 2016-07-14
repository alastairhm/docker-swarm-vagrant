class swarm-agent {
    require docker

    $address = $ipaddress_eth1
    $discovery = hiera('discovery')

    exec { 'swarm join':
	command => "/usr/bin/docker run -d swarm join --advertise=$address:2375 consul://$discovery:8500",
    }

}
