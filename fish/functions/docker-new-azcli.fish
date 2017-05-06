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
    mkdir "script"
    mkdir "ssh"
    mkdir "tools"

    ssh-keygen -t rsa -f "ssh/id_rsa" -q -N ""

    set --local github_axler8tor_ "https://github.com/axler8tor"

    echo "#!/bin/bash
          git clone $github_axler8tor_/azureOSSContainer azacs
          " | sed -e 's/^[ \t]*//' > tools/get-azacs
    chmod u+x tools/get-azacs

    echo "#!/bin/bash
          git clone $github_axler8tor_/azureOSSCompute azcpu
          " | sed -e 's/^[ \t]*//' > tools/get-azcpu
    chmod u+x tools/get-azcpu

    echo "#!/bin/bash
          git clone $github_axler8tor_/azureOSSNetwork aznet
          " | sed -e 's/^[ \t]*//' > tools/get-aznet
    chmod u+x tools/get-aznet

    echo "#!/bin/bash
          git clone $github_axler8tor_/azureOSSStorage azstor
          " | sed -e 's/^[ \t]*//' > tools/get-azstor
    chmod u+x tools/get-azstor

    popd
  end

  # run the container
  docker run                                               \
    --interactive                                          \
    --tty                                                  \
    --volume "$cli_home_/azure:/root/.azure"               \
    --volume "$cli_home_/tools:/root/tools"                \
    --volume "$cli_home_/projects:/root/projects"          \
    --volume "$cli_home_/env:/root/.env"                   \
    --volume "$cli_home_/kube:/root/.kube"                 \
    --volume "$cli_home_/script:/root/.script"             \
    --volume "$cli_home_/ssh:/root/.ssh"                   \
    --name "$cli_"                                         \
    azuresdk/azure-cli-python:latest
end
