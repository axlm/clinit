function docker-clean
    set --local processes (docker ps --all --quiet)
    if not test -z $processes
        docker rm $processes
    end

    set --local nones (docker images | grep "<none>" | awk '{print $3}')
    if not test -n $nones
        docker rmi --force $nones
    else
        printf "%s\n" "No images to remove..."
    end
end
