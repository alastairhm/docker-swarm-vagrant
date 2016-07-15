Vagrant based Docker Swarm sandbox test, using new Features in Docker v1.12

Based on instructions on https://docs.docker.com/engine/swarm/swarm-tutorial/

To start up manager and 2 node cluster

   vagrant up manager agent1 agent2

Once it has started up;

   vagrant ssh manager
   docker node ls
   exit

Add in a second manager node

   vagrant up manager2
