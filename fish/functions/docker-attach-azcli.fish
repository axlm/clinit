function docker-attach-azcli                                   \
  --argument-names cli_                                        \
  --description 'Attach to an existing Azure CLI in Docker'    \

  # there must be a cluster name
  if test -z "$cli_"
    printf "%s" "error: cluster name not specified"
    exit 127
  end

  docker start --interactive --attach "$cli_"
end

# complete --command __docker_attach_azk8s --erase
# complete --command __docker_attach_azk8s --exclusive --arguments "(ls ~/.az | sed -e s'/\///')"
