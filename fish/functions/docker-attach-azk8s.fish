function docker-attach-azk8s                                   \
  --argument-names k8s_cluster_                                \
  --description 'Attach to an existing Kubernetes environment' \

# there must be a cluster name
  if test -z "$k8s_cluster_"
    printf "%s" "error: cluster name not specified"
    docker start --interactive --attach "$k8s_cluster_"
  end
end
