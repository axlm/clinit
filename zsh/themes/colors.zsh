#! /usr/bin/zsh


# _DEBUG=false # Comment out to turn on debugging
[[ -z "$_DEBUG" ]] && readonly _DEBUG=true


[[ -z "$_RH_TERMINATOR" ]] && readonly _RH_TERMINATOR=$'\UE0B0'  # 
[[ -z "$_RH_SEPARATOR"  ]] && readonly _RH_SEPARATOR=$'\UE0B1'   # 
[[ -z "$_LH_TERMINATOR" ]] && readonly _LH_TERMINATOR=$'\UE0B2'  # 
[[ -z "$_LH_SEPARATOR"  ]] && readonly _LH_SEPARATOR=$'\UE0B3'   # 
[[ -z "$_BRANCH"        ]] && readonly _BRANCH=$'\UE0A0'         # 
[[ -z "$_ELIPSIS"       ]] && readonly _ELIPSIS=$'\U2026'        # …

typeset -A _SY
_SY[RHT]=$'\UE0B0'
_SY[RHS]=$'\UE0B1'
_SY[LHT]=$'\UE0B2'
_SY[LHS]=$'\UE0B3'
_SY[BRA]=$'\UE0A0'
_SY[ELI]=$'\U2026'

typeset -A _BG
_BG[BLA]="%K{black}"
_BG[RED]="%K{red}"
_BG[GRE]="%K{green}"
_BG[YEL]="%K{yellow}"
_BG[BLU]="%K{blue}"
_BG[MAG]="%K{magenta}"
_BG[CYA]="%K{cyan}"
_BG[WHI]="%K{white}"
_BG[RST]="%k"

typeset -A _FG
_FG[BLA]="%F{black}"
_FG[RED]="%F{red}"
_FG[GRE]="%F{green}"
_FG[YEL]="%F{yellow}"
_FG[BLU]="%F{blue}"
_FG[MAG]="%F{magenta}"
_FG[CYA]="%F{cyan}"
_FG[WHI]="%F{white}"
_FG[RST]="%f"

_error() {
    printf "error: %s\n" $1
    exit $2
}

__enter() {
    [[ "${_DEBUG}" == true ]] && printf "%s: %s\n" "entering" "$1"
}

__exit() {
    [[ "${_DEBUG}" == true ]] && printf "%s: %s\n" "exiting" "$1"
}

__trace() {
    [[ "${_DEBUG}" == true ]] && printf "%s: %s\n" "  trace" "$@"
}


# Sets the background and foreground
#
# $1 - bg, background
# $2 - fg, foreground
local _sb
_section_begin() {
    __enter "_section_begin"
    __trace "bg = $1"
    __trace "fg = $2"
    _sb="$1$2"
    __trace "sb = $_sb"
    __exit "_section_begin"
}

# $1 - text in the section
local _sc
_section_content() {
    __enter "_section_content"
    _sc="$1"
    __exit "_section_content"
}

# $1 - section separator character
local _sp
_section_part() {
    __enter ${FUNCNAME[1]}
    _sp="$1"
    __exit "_section_part"
}

# $1 - section end character
local _se
_section_end() {
    __enter "_section_end"
    _se="$_FG[RST]$_GB[RST]$1"
    __exit "_section_end"
}

# builds a section
#
# $1 - fc
# $2 - bg
# $3 - fg
# $4 - text
# $5
_section() {
    _section_begin
}

print -P "$_BG[BLA]$_FG[WHI]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"
print -P "$_BG[RED]$_FG[WHI]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"
print -P "$_BG[GRE]$_FG[WHI]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"
print -P "$_BG[YEL]$_FG[WHI]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"
print -P "$_BG[BLU]$_FG[WHI]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"
print -P "$_BG[MAG]$_FG[WHI]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"
print -P "$_BG[CYA]$_FG[WHI]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"
print -P "$_BG[WHI]$_FG[BLA]yaddah$_SY[RHS]$_FG[RST]$_BG[RST]"


_section_begin $_BG[GRE] $_FG[WHI]
_section_content
_section_part
_section_end


print -P "$_sb$_sc_$se"

# echo -e "$_RH_TERMINATOR"
# echo -e "$_RH_SEPARATOR"
# echo -e "$_LH_TERMINATOR"
# echo -e "$_LH_SEPARATOR"
# echo -e "$_BRANCH"
# echo -e "$_ELIPSIS"


# print -P "%F{black}black%f"
# print -P "%F{red}red%f"
# print -P "%F{green}green%f"
# print -P "%F{yellow}yellow%f"
# print -P "%F{blue}blue%f"
# print -P "%F{magenta}magenta%f"
# print -P "%F{cyan}cyan%f"
# print -P "%F{white}white%f"

# print -P "%K{black}black%k"
# print -P "%K{red}red$_RH_TERMINATOR%k" # understand…
# print -P "%K{green}green%k"
# print -P "%K{yellow}yellow%k"
# print -P "%K{blue}blue%k"
# print -P "%K{magenta}magenta%k"
# print -P "%K{cyan}cyan%k"
# print -P "%K{white}white%k"

# print -P "Line(%l)."
# print -P "FQHN(%M)."
# print -P "Host(%m)."
# print -P "User(%n)."
# print -P "Line2(%y)."

# print -P "Privilege(%#)."
# print -P "Exit status(%?)."
# print -P "Parse status(%_)."

# print -P "PWD(%d(%/))."
# print -P "HOME(%~)."

# print -P "History(%h(%!))."
# print -P "Jobs(%j)."

# print -P "SHLVL(%L)."
