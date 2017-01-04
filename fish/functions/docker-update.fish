function docker-update
    for image in (docker images --format '{{.Repository}}' | sort)
        docker pull $image
        echo ""
    end
end

