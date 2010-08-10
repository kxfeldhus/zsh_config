autoload -U compinit
compinit
autoload -U colors
colors
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall

typeset -ga preexec_functions
typeset -ga chpwd_functions

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# === Frequent Aliases ===
alias ll="ls -lGha --color=auto"
alias g="gedit & disown"
alias ff="firefox & disown"
alias ee="emacs & disown"
alias x="exit"

# === Git Branch Info
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})"
}

# === Rails ===
alias s-s="./script/server"
alias s-c="./script/console"

# === PROMPT ===
setopt prompt_subst

autoload -U promptinit
promptinit

PROMPT="%{$fg_bold[white]%}%{$fg[white]%}%~%{$reset_color%}
%{$fg_bold[red]%}>%{$reset_color%}"

#PROMPT='%{$fg_bold[white]%}%n@%m %{$fg[blue]%}%c %{$fg_bold[red]%}%{$reset_color%}'
RPROMPT='%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}[%*]'

# === RVM ===
if [ -s ~/.rvm/scripts/rvm ] ; then
    source ~/.rvm/scripts/rvm ;
fi