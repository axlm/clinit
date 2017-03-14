function docker-attach-azcli                                   \
  --argument-names k8s_cluster_                                \
  --description 'Attach to an existing Kubernetes environment' \

  # there must be a cluster name
  if test -z "$k8s_cluster_"
    printf "%s" "error: cluster name not specified"
    exit 127
  end

  docker start --interactive --attach "$k8s_cluster_"
end

# complete --command __docker_attach_azk8s --erase
# complete --command __docker_attach_azk8s --exclusive --arguments "(ls ~/.az/acs/k8s | sed -e s'/\///')"
