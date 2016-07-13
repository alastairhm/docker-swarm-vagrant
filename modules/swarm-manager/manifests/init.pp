class swarm-manager {
        require docker

	exec {'consul start':
	   command => '/usr/bin/docker run -d -p 8500:8500 --name=consul progrium/consul -server -bootstrap',
        } ->
	exec {'manager start':
	   command => "/usr/bin/docker run -d -p 4000:4000 swarm manage -H :4000 --replication --advertise $ipaddress_eth1:4000 consul://$ipaddress_eth1:8500",
	}
}
