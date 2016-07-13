node /manager/ {
    include swarm-manager
}

node /agent/ {
    include swarm-agent
}

node /discovery/ {
    include swarm-discovery
}
