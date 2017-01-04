function docker-clean
    set --local processes (docker ps --all --quiet)
    if not test -z $processes
        docker rm $processes
    end
    docker rmi --force (docker images | grep "<none>" | awk '{print $3}')
end

