function docker-run-tmp
    if count $argv -lt 2
        docker run --interactive --tty --name "$argv[1]".(timestamp *) --rm $argv[1]
    else
        docker run --interactive --tty --name "$argv[1]".(timestamp *) --rm $argv[1] $argv[2]
    end
end

