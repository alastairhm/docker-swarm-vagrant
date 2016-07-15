# Vagrant based Docker Swarm sandbox test
## using new Features in Docker v1.12

Based on instructions on <https://docs.docker.com/engine/swarm/swarm-tutorial/>
Using Pre-release v1.12.0-rc4 <https://github.com/docker/docker/releases>

To start up manager and 2 node cluster

   `vagrant up manager agent1 agent2`

Once it has started up;

   ```
   vagrant ssh manager
   docker node ls
   exit
   ```
```
vagrant@manager:~$ docker node ls
ID                           HOSTNAME       MEMBERSHIP  STATUS  AVAILABILITY  MANAGER STATUS
3osy9ro4itrgsa8jan0pjh2rj *  manager.swarm  Accepted    Ready   Active        Leader
8k5iekt04969qgdpkcevfp5lx    agent1.swarm   Accepted    Ready   Active
d1fercip5d7kvra40k2rgbf0u    agent2.swarm   Accepted    Ready   Active
```

Add in a second manager node

   ```
   vagrant up manager2
   vagrant ssh manager
   docker node ls
   ```

```
vagrant@manager:~$ docker node ls
ID                           HOSTNAME        MEMBERSHIP  STATUS  AVAILABILITY  MANAGER STATUS
2blz45lhzlyq5ps688yanhtjh    manager2.swarm  Accepted    Ready   Active        Reachable
3osy9ro4itrgsa8jan0pjh2rj *  manager.swarm   Accepted    Ready   Active        Leader
8k5iekt04969qgdpkcevfp5lx    agent1.swarm    Accepted    Ready   Active
d1fercip5d7kvra40k2rgbf0u    agent2.swarm    Accepted    Ready   Active
```

You can now follow the tutorial about adding services
<https://docs.docker.com/engine/swarm/swarm-tutorial/deploy-service/>

