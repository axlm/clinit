#! /usr/bin/zsh

() {
    # If the separator and terminator characters does not display correctly,
    # download your favourite PowerLine patched font at
    # `https://github.com/powerline/fonts`.
    # I really like fantasque; get it at
    # `https://github.com/belluzj/fantasque-sans`.

    local LC_ALL="" LC_CTYPE="en_US.UTF-8" # TODO: Figure out why...
}


# SYMBOLS
typeset -A _SYMBOL
_SYMBOL[RHT]=$'\UE0B0' # , right hand terminator
_SYMBOL[RHS]=$'\UE0B1' # , right hand separator
_SYMBOL[LHT]=$'\UE0B2' # , left hand terminator
_SYMBOL[LHS]=$'\UE0B3' # , left hand separator
_SYMBOL[VCB]=$'\UE0A0' # , version control system branch
_SYMBOL[ELI]=$'\U2026' # …, ellipsis

# TODO: investigate, should I use $bg instead?
# BACKGROUND
typeset -A _BACKGROUND
_BACKGROUND[BLA]="%K{black}"
_BACKGROUND[RED]="%K{red}"
_BACKGROUND[GRE]="%K{green}"
_BACKGROUND[YEL]="%K{yellow}"
_BACKGROUND[BLU]="%K{blue}"
_BACKGROUND[MAG]="%K{magenta}"
_BACKGROUND[CYA]="%K{cyan}"
_BACKGROUND[WHI]="%K{white}"
_BACKGROUND[RST]="%k"

# TODO: investigate, should I use $bg instead?
# FOREGROUND
typeset -A _FOREGROUND
_FOREGROUND[BLA]="%F{black}"
_FOREGROUND[RED]="%F{red}"
_FOREGROUND[GRE]="%F{green}"
_FOREGROUND[YEL]="%F{yellow}"
_FOREGROUND[BLU]="%F{blue}"
_FOREGROUND[MAG]="%F{magenta}"
_FOREGROUND[CYA]="%F{cyan}"
_FOREGROUND[WHI]="%F{white}"
_FOREGROUND[RST]="%f"


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
local _MODE
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
local _USER
_user() {
    # TODO: implement
}

# Show current working directory
#
#   <path> black on green
#
local _CWD
_cwd() {

}

# Show current Python virtual environment (if present)
#
#   <venv_name> bold white on blue
#
local _VENV
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
local _GIT
_git() {

}

# Show number of commands typed in this shell
#
#   <number> white on black
local _CCC
_ccc() {

}

# Show last command exit (if not 0)
#
#   <exit_code> white on red
local _STATUS
_status() {

}

# Return the prompt to normal
_end() {

}

_prompt() {
    # N > axl > ~/Projects/…/Blah > _koos > 10 >
    _mode    # vi mode indicator
    _user    # whoami
    _cwd     # whereami
    _venv    # which venv (opt)
    _git     # git info (opt) — rprompt
    _ccc     # necessary?
    _status  # last command exit status (opt)
    _end     # terminator
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
