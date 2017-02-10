# BEHAVIOUR
#fish_vi_mode

# GREETING
set fish_greeting ''

# PATHS
## CONSTANTS
set OPT_HOME                            /opt/axl
set CARGO_HOME                          $HOME/.cargo
set PROJECTS_HOME                       $HOME/Projects
set NODE_MODULES_HOME                   $HOME/.node_modules

## PREPEND
set --global --export PATH $HOME/.bin       $PATH
set --global --export PATH $HOME/.local/bin $PATH

## APPEND
set --global --export PATH $PATH        $CARGO_HOME/bin
set --global --export PATH $PATH        $NODE_MODULES_HOME/bin

# DEFINES
set --global --export TMP               /tmp
set --global --export RUST_SRC_PATH     $HOME/.lib/src/rust/src

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
    alias axler8tor cd\ $PROJECTS_HOME/axler8tor
    alias github    cd\ $PROJECTS_HOME/GitHub
    alias downloads cd\ $HOME/Downloads
    alias music     cd\ $HOME/Music
    alias fish      cd\ $HOME/.config/fish
    alias bin       cd\ $HOME/.bin
    alias lib       cd\ $HOME/.lib
    alias :q        exit
    alias clipboard xsel\ --input\ --clipboard

    # COLORS
    dircolors --c-shell $HOME/.dircolors | source

    # POWERLINE
    set --global --export POWERLINE "ON"
    set fish_function_path $fish_function_path "/home/axl/.local/lib/python3.5/site-packages/powerline/bindings/fish"
    powerline-setup
end
