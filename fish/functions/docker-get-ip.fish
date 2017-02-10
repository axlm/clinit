function docker_get_ip_address
    set container $argv[1]
    sudo docker inspect --format='{{ .NetworkSettings.IPAddress }}' $container
end

