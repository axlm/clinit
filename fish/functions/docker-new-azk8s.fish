function docker-new-azk8s                                  \
  --argument-names k8s_cluster_                            \
  --description 'Connect to a Kubernetes cluster in Azure' \

  # there must be a cluster name
  if test -z "$k8s_cluster_"
    printf "%s" "error: cluster name not specified"
    exit 127
  end

  set --local azk8s_home_   "$HOME/.az/acs/k8s"
  set --local cluster_home_ "$azk8s_home_/$k8s_cluster_"

  # set up the environment
  if not test -d "$cluster_home_"
    mkdir -p "$cluster_home_"
    pushd "$cluster_home_"
    mkdir "azure"
    mkdir "env"
    mkdir "kube"
    mkdir "script"
    mkdir "ssh"
    ssh-keygen -t rsa -f "ssh/rsa_$k8s_cluster_" -q -N ""
    popd
  end

  # run the container
  docker run                                               \
    --interactive                                          \
    --tty                                                  \
    --net=host                                             \
    --volume "$cluster_home_/azure:/root/.azure"           \
    --volume "$cluster_home_/env:/root/.env"               \
    --volume "$cluster_home_/kube:/root/.kube"             \
    --volume "$cluster_home_/script:/root/.script"         \
    --volume "$cluster_home_/ssh:/root/.ssh"               \
    --name "$k8s_cluster_"                                 \
    azuresdk/azure-cli-python:latest
end
