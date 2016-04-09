function maintain-repositories
    for repository in (get-repositories)
        pushd $repository
        echo (pwd)
        git gc
        popd
        echo
    end
end


function list-repositories
    for repository in (get-repositories)
        if [ "$repository" = "clinit/" ]
            continue
        end

        pushd $repository
        echo
    
        set branch (git branch | sed -e 's/^\* //')
        set remote (git remote -v | grep '(fetch)' | sed -e 's/ (fetch)//')
        echo "path  : " (pwd)
        echo "branch: " $branch
        echo "remote: " $remote
        popd
    end
end


function generate-repository-clone-script
    set file (pwd)/clone-repositories
    if test -e $file
        command rm $file
    end
    set fish (which fish)
    echo "#!$fish" >> $file

    for repository in (get-repositories)
        if [ "$repository" = "clinit/" ]
            continue
        end

        pushd $repository
        set branch (git branch | sed -e 's/^\* //')
        set remote (git remote -v           | \
                    grep '(fetch)'          | \
                    sed -e 's/\s*(fetch)//' | \
                    sed -e 's/^origin\s*//')
        set pwd (pwd)
        set command "git clone $remote --branch $branch $pwd"
        echo $command >> $file
        popd
    end

    echo "#end" >> $file
    chmod "u+x" $file
end


function update-repositories
    for repository in (get-repositories)
        if [ "$repository" = "clinit/" ]
            continue
        end
       
        pushd $repository
        echo
        
        echo (pwd)
        set branch (git branch | sed -e 's/^\* //')
        git pull origin $branch
        popd
    end
end


function reset-repositories
    for repository in (get-repositories)
        if [ "$repository" = "clinit/" ]
            continue
        end
       
        pushd $repository
        echo
        
        echo (pwd)
        set branch (git branch | sed -e 's/^\* //')
        git fetch --all
        git reset --hard origin/$branch
        popd
    end
end


function get-repositories
    ls -d */ | sed -e 's/\/\/$/\//'
end


function get-repository-status
    for directory in (lsd)
        pushd $directory
        echo (pwd)
        git status --short
        popd
        echo
    end
end

