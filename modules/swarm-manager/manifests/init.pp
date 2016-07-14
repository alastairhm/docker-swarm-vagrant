class swarm-manager {
        require docker

        $discovery = hiera('discovery')

	exec {'manager start':
	   command => "/usr/bin/docker run -d -p 4000:4000 swarm manage -H :4000 --replication --advertise $ipaddress_eth1:4000 consul://$discovery:8500",
	}
}
