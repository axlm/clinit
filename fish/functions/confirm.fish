function confirm
    while true
        read -l -p confirm_prompt confirm
        switch $confirm
        case '' N n
            return 1
        case Y y
            return 0
        end
    end
end

function confirm_prompt
    echo 'Continue? [y/N] '
end

