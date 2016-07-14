class swarm-manager {
        require docker

        $discovery = hiera('discovery')
        $secret = hiera('secret')

	exec {'manager start':
	   command => "/usr/bin/docker swarm init --listen-addr $ipaddress_eth1:2377 --secret $secret",
	}
}
