# Modified from Prezto.

# Disable globbing.
(( $+commands[bower] )) && alias bower='noglob bower'
alias fc='noglob builtin fc'
(( $+commands[fd] )) && alias fd='noglob fd'
(( $+commands[find] )) && alias find='noglob find'
(( $+commands[ftp] )) && alias ftp='noglob ftp'
alias history='noglob history'
(( $+commands[locate] )) && alias locate='noglob locate'
(( $+commands[rake] )) && alias rake='noglob rake'
(( $+commands[rsync] )) && alias rsync='noglob rsync'
(( $+commands[scp] )) && alias scp='noglob scp'
(( $+commands[sftp] )) && alias sftp='noglob sftp'
(( $+functions[zmv] )) && alias zmv='noglob zmv'

# Define general aliases.
alias _='sudo'
alias b='${(z)BROWSER}'

alias diffu="diff --unified"
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias p='${(z)PAGER}'
alias po='popd'
alias pu='pushd'
alias sa='alias | grep -i'

# BSD ls colors.
export LSCOLORS='exfxcxdxbxGxDxabagacad'

alias ls='command ls --color=auto'
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.

# Grep colors.
export GREP_COLOR='37;45'           # BSD.
export GREP_COLORS="mt=$GREP_COLOR" # GNU.

alias grep="${aliases[grep]:-grep} --color=auto"

# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

# Serves a directory via HTTP.
# Try Python 3 first. If no python3, maybe the system udes Python 2 as python. so use that.
if (( $+commands[python3] )); then
  # Python 3
  alias http-serve='python3 -m http.server'
else
  # Python 2
  alias http-serve='python -m SimpleHTTPServer'
fi
