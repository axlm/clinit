# BEHAVIOUR
#fish_vi_mode

# GREETING
set fish_greeting ''

# PATHS
## CONSTANTS
set OPT_HOME                            /opt/axl
set CARGO_HOME                          $HOME/.cargo
set PROJECTS_HOME                       $HOME/Projects
set NODEJS_HOME                         $OPT/node-v5.10.1-linux-x64

## PREPEND
set --global --export PATH $HOME/.bin   $PATH

## APPEND
set --global --export PATH $PATH        $NODEJS_HOME/bin
set --global --export PATH $PATH        $CARGO_HOME/bin
set --global --export PATH $PATH        $PROJECTS_HOME/GitHub/lang-rust/src

# DEFINES
set --global --export TMP               /tmp
set --global --export RUST_SRC_PATH     $HOME/.lib/rustc-1.8.0/src

# APPS
set --global --export BROWSER google-chrome
set --global --export PAGER   less

if status --is-interactive
    # ALIASES
    alias ..        cd\ ..
    alias ...       cd\ ../..
    alias ....      cd\ ../../..
    alias .....     cd\ ../../../..
    alias projects  cd\ $PROJECTS_HOME
    alias annaxxko  cd\ $PROJECTS_HOME/annaxxKØ
    alias github    cd\ $PROJECTS_HOME/GitHub
    alias downloads cd\ $HOME/Downloads
    alias music     cd\ $HOME/Music
    alias fish      cd\ $HOME/.config/fish
    alias bin       cd\ $HOME/.bin
    alias :q        exit

    # COLORS
    eval (dircolors --c-shell $HOME/.dircolors)

    # POWERLINE
    set --global --export POWERLINE "ON"
    set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"
    powerline-setup
end

