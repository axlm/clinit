function stdcfg-find-links
  for link in (find . -type l)
    ls -lGg "$link"
  end | grep clinit | sed -e 's/^l.*x 1 [0-9]* [a-zA-Z]*[ ]*[0-9]* [0-9:]* //'
end
