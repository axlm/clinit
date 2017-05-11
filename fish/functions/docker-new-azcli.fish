function docker-new-azcli                          \
  --argument-names cli_                            \
  --description 'Provision an Azure CLI in Docker' \

  # there must be a cluster name
  if test -z "$cli_"
    printf "%s\n" "error: cli name not specified"
    exit 127
  end

  set --local az_home_   "$HOME/.az"
  set --local az_azqst_  "$az_home_/.azqst"
  set --local cli_home_  "$az_home_/$cli_"

  # make sure the quickstart templates are up to date
  if not test -d "$az_azqst_"
    printf "%s\n" "Pulling Azure Quick Start Templates."
    printf "%s\n" "This may take a while..."

    mkdir -p "$az_azqst_"
    git clone https://github.com/Azure/azure-quickstart-templates.git "$az_azqst_"
  else
    printf "%s\n" "Updating Azure Quick Start Templates."
    printf "%s\n" "This may take a while..."

    pushd "$az_azqst_"
    git pull
    popd
  end

  # create environement
  if not test -d "$cli_home_"
    mkdir -p "$cli_home_"

    pushd "$cli_home_"
    mkdir "azure"
    mkdir "data"
    mkdir "kube"
    mkdir "ssh"
    ssh-keygen -t rsa -f "ssh/id_rsa" -q -N ""
    popd
  end

  # run the container
  clear

  docker run                                       \
    --interactive                                  \
    --tty                                          \
    --rm                                           \
    --volume "$az_azqst_:/root/azqst:ro"           \
    --volume "$cli_home_/azure:/root/.azure"       \
    --volume "$cli_home_/data:/root/data"          \
    --volume "$cli_home_/kube:/root/.kube"         \
    --volume "$cli_home_/ssh:/root/.ssh"           \
    --name "$cli_"                                 \
    azuresdk/azure-cli-python:latest
end
