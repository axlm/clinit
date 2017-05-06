function docker-new-azcli                          \
  --argument-names cli_                            \
  --description 'Provision an Azure CLI in Docker' \

  # there must be a cluster name
  if test -z "$cli_"
    printf "%s" "error: cli name not specified"
    exit 127
  end

  set --local az_home_   "$HOME/.az"
  set --local cli_home_  "$az_home_/$cli_"

  # set up the environment
  if not test -d "$cli_home_"
    mkdir -p "$cli_home_"

    pushd "$cli_home_"

    mkdir "azure"
    mkdir "env"
    mkdir "kube"
    mkdir "projects"
    mkdir "scripts"
    mkdir "ssh"

    ssh-keygen -t rsa -f "ssh/id_rsa" -q -N ""

    git clone https://github.com/Azure/azure-quickstart-templates.git projects/azqst

    popd
  end

  # run the container
  docker run                                               \
    --interactive                                          \
    --tty                                                  \
    --volume "$cli_home_/azure:/root/.azure"               \
    --volume "$cli_home_/env:/root/.env"                   \
    --volume "$cli_home_/kube:/root/.kube"                 \
    --volume "$cli_home_/projects:/root/projects"          \
    --volume "$cli_home_/script:/root/.scripts"            \
    --volume "$cli_home_/ssh:/root/.ssh"                   \
    --name "$cli_"                                         \
    azuresdk/azure-cli-python:latest
end
