function docker-list-azcli
  echo (ls "$HOME/.az/acs/k8s") | sed -e 's/\///g'
end
