# path
export GOPATH=$HOME/Code/go
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/Developer/Applications/Xcode.app/Contents/Developer/usr/bin:$GOPATH/bin:$PATH

# homebrew and cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# load private tokens that don't belong in a public repo
if [[ -f ~/.private-tokens ]]; then
  source ~/.private-tokens
fi

# tmp hack
export LIBRARY_PATH=/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1

# virtualenv and virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# aliases
alias ls='ls -FG'
alias ll='ls -lh'
alias la='ls -a'
alias diff='diff -u'
alias dos2unix='dos2unix -c mac'
alias e='mvim'
alias locate='locate -i'
alias open-chrome='open -a "Google Chrome.app"'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias ql='qlmanage -p "$@" >& /dev/null'
alias p='python'
alias json='python -m json.tool'
alias syspy='/usr/bin/python'
#alias tmux="TERM=screen-256color-bce tmux"

# grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='32;1;4' # green, bold, underline

# ls colors
# generator: http://geoff.greer.fm/lscolors/
export LSCOLORS='cxfxcxdxbxegedabagacad'

# editors
export EDITOR=vim
export VISUAL=vim

# history
HISTFILE=~/.history_zsh
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# zsh line editing
bindkey -e

# useful functions
dff() { # pipe diff thru colordiff
  diff $* | colordiff
}
topten() { # 10 most common recent commands
  history | awk '{print $2}' | sort | uniq -c | sort -rn | grep -v 'topten' | head -10
}
myip() {
  curl -s http://ip.appspot.com
}
ding() {
  afplay $(ls -d1 /System/Library/Sounds/** | gsort -R | head -n1)
}

# enable autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# more custom stuffs
zstyle :compinstall filename '/Users/phil/.zshrc'   # autocomplete from zshrc
fpath=(~/.zsh/completion $fpath)  # load custom completion scripts
autoload -Uz compinit
compinit

# other settings
setopt autocd beep extendedglob nomatch
unsetopt notify

# prompt
autoload -U colors && colors
PROMPT="%{$fg_bold[white]%}%{$bg[red]%}%1d%{$reset_color%}%{$fg_bold[white]%} >> %{$reset_color%}"
RPROMPT=""
