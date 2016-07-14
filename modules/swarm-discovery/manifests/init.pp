class swarm-discovery {
        require docker

	exec {'consul start':
	   command => '/usr/bin/docker run -d -p 8500:8500 --name=consul progrium/consul -server -bootstrap',
        }
}
