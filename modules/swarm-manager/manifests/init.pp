class swarm-manager {
        require docker

        $discovery = hiera('discovery')
        $secret = hiera('secret')
        $manager = hiera('manager')

	if $ipaddress_eth1 == $manager {
	    exec {'manager start':
	       command => "/usr/bin/docker swarm init --listen-addr $ipaddress_eth1:2377 --secret $secret --auto-accept worker,manager",
	    }
        }
        else {
            exec { 'swarm join':
                command => "/usr/bin/docker swarm join --secret $secret --manager --listen-addr $ipaddress_eth1:2377 $manager:2377",
            }
        }
}
