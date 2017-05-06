function docker-new-azcli                          \
  --argument-names cli_                            \
  --description 'Provision an Azure CLI in Docker' \

  # there must be a cluster name
  if test -z "$cli_"
    printf "%s" "error: cli name not specified"
    exit 127
  end

  set --local az_home_   "$HOME/.az"
  set --local az_azqst_  "$az_home_/azqst"
  set --local cli_home_  "$az_home_/$cli_"

  if not test -d "$az_azqst_"
    mkdir -p "$az_azqst_"
    git clone https://github.com/Azure/azure-quickstart-templates.git "$az_azqst_"
  else
    pushd "$az_azqst_"
    git pull
    popd
  end

  if not test -d "$cli_home_"
    mkdir -p "$cli_home_"

    pushd "$cli_home_"

    mkdir "azure"
    mkdir "env"
    mkdir "kube"
    mkdir "scripts"
    mkdir "ssh"

    ssh-keygen -t rsa -f "ssh/id_rsa" -q -N ""

    popd
  end

  # run the container
  docker run                                               \
    --interactive                                          \
    --tty                                                  \
    --volume "$az_azqst_:/root/azqst:ro"                   \
    --volume "$cli_home_/azure:/root/.azure"               \
    --volume "$cli_home_/env:/root/.env"                   \
    --volume "$cli_home_/kube:/root/.kube"                 \
    --volume "$cli_home_/script:/root/.scripts"            \
    --volume "$cli_home_/ssh:/root/.ssh"                   \
    --name "$cli_"                                         \
    azuresdk/azure-cli-python:latest
end
