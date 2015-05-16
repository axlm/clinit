if status --is-interactive
    # greeting
    set fish_greeting ''
    # path
    set --global --export PATH .            $PATH
    set --global --export PATH $HOME/.bin   $PATH
    # tmp
    set --global --export TMP               /tmp
    # apps
    set --global --export BROWSER           google-chrome
    set --global --export PAGER             less
    # aliases
    alias - cd\ -
    alias ... cd\ ../..
    alias .... cd\ ../../..
    alias ..... cd\ ../../../../
    # colors
    eval (dircolors --c-shell /home/axl/.dircolors)
    # powerline
    set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"
    powerline-setup
    set PATH $HOME/.bin $PATH
end

