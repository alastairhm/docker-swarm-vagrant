# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
config.vm.box = "ubuntu/trusty64"

config.vm.provision :puppet do |puppet|
  puppet.manifests_path = "manifests"
  puppet.manifest_file  = "default.pp"
  puppet.module_path = 'modules'
  puppet.hiera_config_path = 'hiera.yaml'
  puppet.working_directory = '/vagrant'
  #puppet.options = "--debug"
end

config.vm.define "discovery" do |dis|
  dis.vm.box = "ubuntu/trusty64"
  dis.vm.hostname = "discovery.swarm"
  dis.vm.network "private_network", ip: "192.168.50.20"
end

config.vm.define "manager" do |mng|
  mng.vm.box = "ubuntu/trusty64"
  mng.vm.hostname = "manager.swarm"
  mng.vm.network "private_network", ip: "192.168.50.10"
end

config.vm.define "manager2" do |mng|
  mng.vm.box = "ubuntu/trusty64"
  mng.vm.hostname = "manager2.swarm"
  mng.vm.network "private_network", ip: "192.168.50.11"
end

config.vm.define "agent1" do |ag1|
  ag1.vm.box = "ubuntu/trusty64"
  ag1.vm.hostname = "agent1.swarm"
  ag1.vm.network "private_network", ip: "192.168.50.2"
end

config.vm.define "agent2" do |ag2|
  ag2.vm.box = "ubuntu/trusty64"
  ag2.vm.hostname = "agent2.swarm"
  ag2.vm.network "private_network", ip: "192.168.50.3"
end

end
