function docker-clean
    docker rm (docker ps --all --quiet)
    docker rmi --force (docker images | grep "^<none>" | awk '{print $3}')
end

