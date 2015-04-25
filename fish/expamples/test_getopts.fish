#!/usr/bin/env fish
echo Enter test_getopts.fish
function test_getopts
    echo Enter test_getopts
    while set clarg (getopts "l:long x:extra: o:optional:^" $argv)
        echo $clarg[1]
        switch $clarg[1]
            case l
                echo "l"
            case o
                echo "o=`$clarg[2]`"
            case x
                echo "x=`$clarg[2]`"
            case \*
                echo "unknown=`$clarg[1]`"
        end
    end
    echo -n operands: "`$clarg`"
    echo Exit test_getopts
end
echo Exit test_getopts.fish

