function rm
  # set_color white -o
  echo "The following files will be deleted:"
  # set_color normal
  ls -C --group-directories-first $argv
  set_color red -o
  echo "This operation cannot be undone!"
  set_color normal
  if confirm
    command rm --force --recursive --verbose $argv
  else
    echo "Cancelled"
  end
end
