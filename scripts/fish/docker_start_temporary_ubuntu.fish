function docker_start_temporary_ubuntu
    sudo docker run --rm --interactive --tty --name tembuntu ubuntu /bin/bash
end

