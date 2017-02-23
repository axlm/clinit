function docker-list-azk8s
  echo (ls "$HOME/.az/acs/k8s") | sed -e 's/\///g'
end