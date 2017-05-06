function docker-remove-azcli          \
  --argument-names cli_               \
  --description 'Remove an Azure CLI' \
  docker rm "$cli_"
  rm ~/.az/"$cli_"
end
