# Created by newuser for 5.8

#!/bin/sh
#
# ufetch-elcix os fork of ufecth

## INFO
 
# user is already defined
os='Elcix OS pre-release 2.1'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename "$SHELL")"
build='2157'
de='elcwm'

## UI DETECTION

if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -f "${HOME}/.xinitrc" ]; then
	ui="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
	uitype='WM'
elif [ -f "${HOME}/.xsession" ]; then
	ui="$(tail -n 1 "${HOME}/.xsession" | cut -d ' ' -f 2)"
	uitype='WM'
else
	ui='unknown'
	uitype='UI'
fi

## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${blue}"        # labels
nc="${reset}${bold}${blue}"        # user and hostname
ic="${reset}"                       # info
c0="${reset}${white}"               # logo color

## OUTPUT

cat <<EOF
${c0}  ▄▄        ▄▄    ${nc}OS:${ic}${os}${reset}
${c0} █  █      █  █   ${lc}BUILD:${ic}${build}${reset}
${c0} █  █      █  █   ${lc}KERNEL:${ic}${kernel}${reset}
${c0} █  █  ▄▄  █  █   ${lc}UPTIME:${ic}${uptime}${reset}
${c0} █  █ █  █ █  █   ${lc}PACKAGES:${ic}${packages}${reset}
${c0} █  █  ▀▀  █  █   ${lc}SHELL:${ic}${shell}${reset}
${c0} █  █      █  █   ${lc}DE:${ic}${de}${reset} 
${c0} █  █      █  █     
${c0}  ▀▀        ▀▀ 
EOF

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
# alias

alias pacs="sudo pacman -S"
alias gc="git clone"
alias colormoix="./colormoix.py"
alias wheathermoix="./wheather.py"
alias pacupdate="sudo pacman -Syu"
alias gc-elcix="gc https://github.com/HexaOneOfficial/Elcix-OS.git"
alias about="./ufetch.py"

# ls = ls -lah

alias 2='ls -lah --color=auto'
alias ls='2'


# zoom command

alias plus='xdotool key Ctrl+plus'
alias min='xdotool key Ctrl+minus'
