class swarm-agent {
    require docker

    $address = $ipaddress_eth1

    exec { 'swarm join':
	command => "/usr/bin/docker run -d swarm join --advertise=$address:2375 consul://192.168.50.10:8500",
    }

}
