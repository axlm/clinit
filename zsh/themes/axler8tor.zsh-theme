#! /usr/bin/zsh

() {
    # If the separator and terminator characters does not display correctly,
    # download your favourite PowerLine patched font at
    # `https://github.com/powerline/fonts`.
    # I really like fantasque; get it at
    # `https://github.com/belluzj/fantasque-sans`.

    local LC_ALL="" LC_CTYPE="en_US.UTF-8" # TODO: Figure out why...
}

[[ -z "$_RH_SEPARATOR"  ]] && readonly _RH_SEPARATOR=$'\UE0B1'   # 
[[ -z "$_RH_TERMINATOR" ]] && readonly _RH_TERMINATOR=$'\UE0B0'  # 
[[ -z "$_LH_SEPARATOR"  ]] && readonly _LH_SEPARATOR=$'\UE0B3'   # 
[[ -z "$_LH_TERMINATOR" ]] && readonly _LH_TERMINATOR=$'\UE0B2'  # 
[[ -z "$_BRANCH"        ]] && readonly _BRANCH=$'\UE0A0'         # 
[[ -z "$_ELIPSIS"       ]] && readonly _ELIPSIS=$'\U2026'        # …


# Display a section, setting foreground, background and text
_section() {
    local _foreground
    local _background
    local _terminator
    local _separator

    [[ -z $! ]]; _foreground
}

# Show zsh's current vi mode
#
# | Mode     | Display
# +----------+----------------------
# | Normal   | "N" green on black
# | Insert   | "I" black on yellow
# | Replace  | "R" black on red
# | Visual   | "V" black on cyan
#
_mode() {

}

# Show the current user
#
# | User ID | Display
# +---------+------------------------
# | 0       | <user> yellow on red
# | 1000    | <user> white on blue
# | else    | <user> black on yello
#
_user() {
    # TODO: implement
}

# Show current working directory
#
#   <path> black on green
#
_cwd() {

}

# Show current Python virtual environment (if present)
#
#   <venv_name> bold white on blue
#
_venv() {

}

# Show git information (if present)
#
# | Branch         | Display
# +----------------+------------------------------
# | Master         | "master",  grey on black
# | Develop        | "develop", green on black
# | Feature        | <name>,    black on cyan
# | Hotfix         | <name>,    yello on magenta
#
# | Branch Info    | Disply
# +----------------+------------------------------
# | Ignored        | "i"N
# | Added          | "+"N
# | Removed        | "-"N
# | Modified       | "~"N
# | Commits Ahead  | ""
# | Commits Behind | ""
#
# TODO: include hints for additions, removals and modifications
_git() {

}

# Show number of commands typed in this shell
#
#   <number> white on black
_session_count() {

}

# Show last command exit (if not 0)
#
#   <exit_code> white on red
_status() {

}

# Return the prompt to normal
_end() {

}

_prompt() {
    # N > axl > ~/Projects/…/Blah > _koos > 10 >
    _mode           # vi mode indicator
    _user           # whoami
    _cwd            # whereami
    _venv           # which venv (opt)
    _git            # git info (opt) — rprompt
    _session_count  # necessary?
    _status         # last command exit status (opt)
    _end            # terminator
}

_prompt2() { }

_rprompt() {
    _git_branch
    _git_status
    _git_local_ahead
    _git_local_behind
    _git_stash
}

PROMPT="$(_prompt)"
PROMPT2="$(_prompt2)"
RPROMPT="$(_rprompt)"
