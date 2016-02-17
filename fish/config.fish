if status --is-interactive
    # behaviour
    fish_vi_key_bindings
    # greeting
    set fish_greeting ''
    ## bin path
    set --global --export BIN $HOME/.bin
    ## cargo path
    set --global --export CARGO     $HOME/.cargo
    set --global --export CARGO_BIN $CARGO/bin
    ## path
    set --global --export PATH $CARGO_BIN   $PATH
    set --global --export PATH $CARGO       $PATH
    set --global --export PATH $BIN         $PATH
    # set --global --export PATH .            $PATH
    # tmp
    set --global --export TMP  /tmp
    # apps
    set --global --export BROWSER google-chrome
    set --global --export PAGER   less
    # aliases
    alias - cd\ -
    alias ... cd\ ../..
    alias .... cd\ ../../..
    alias ..... cd\ ../../../../
    # colors
    eval (dircolors --c-shell /home/axl/.dircolors)
    # powerline
    set --global --export POWERLINE "ON"
    set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"
    powerline-setup
end

