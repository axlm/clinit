function docker-list-azcli
  echo (ls "$HOME/.az") | sed -e 's/\///g'
end
