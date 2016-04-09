if status --is-interactive
    # BEHAVIOUR
    #fish_vi_mode

    # GREETING
    set fish_greeting ''

    # PATH
    ## CONSTANTS
    set OPT                                 /opt/axl
    set CARGO                               $HOME/.cargo
    set PROJECTS                            $HOME/Projects
    ## PREPEND
    set --global --export PATH $HOME/.bin   $PATH
    set --global --export PATH .            $PATH
    ## APPEND
    set --global --export PATH $PATH        $CARGO
    set --global --export PATH $PATH        $CARGO/bin
    set --global --export PATH $PATH        $PROJECTS/GitHub/lang-rust/src
    set --global --export PATH $PATH        $OPT/swift-latest/usr/bin

    # DEFINES
    set --global --export RUST_SRC_PATH     $HOME/Projects/GitHub/lang-rust/src

    # TMP
    set --global --export TMP  /tmp

    # APPS
    set --global --export BROWSER google-chrome
    set --global --export PAGER   less

    # ALIASES
    alias - cd\ -
    alias ... cd\ ../..
    alias .... cd\ ../../..
    alias ..... cd\ ../../../../

    # COLORS
    eval (dircolors --c-shell $HOME/.dircolors)

    # POWERLINE
    set --global --export POWERLINE "ON"
    set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"
    powerline-setup
end

