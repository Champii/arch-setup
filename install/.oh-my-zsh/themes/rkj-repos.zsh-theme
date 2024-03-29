# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: http://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

function hg_prompt_info {
    hg prompt --angle-brackets "\
<hg:%{$fg[magenta]%}<branch>%{$reset_color%}><:%{$fg[magenta]%}<bookmark>%{$reset_color%}>\
</%{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[red]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}✈"

function mygit() {
  ref1=$(git symbolic-ref HEAD 2> /dev/null) || return
  ref2=$(git rev-parse HEAD | head -c 6) || return
  ref="$ref1 %{$fg[green]%}$ref2"
  #ref=$(git symbolic-ref HEAD 2> /dev/null) $(git rev-parse HEAD | head -c 6) || return
  echo "\e[0m%}-%{\e[0;31m%}[\e[0m%}$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$( git_prompt_status )%{$reset_color%}$ZSH_THEME_GIT_PROMPT_SUFFIX%{\e[0;31m%}]%{\e[0m%}%b"
}

function retcode() {}

# alternate prompt with git & hg
PROMPT=$'
\e[31m┌─%b%{\e[0;31m%}[%b%{\e[1;33m%}%~%{\e[0;31m%}]%b%{\e[0m%}-%{\e[0;31m%}[%b%{\e[0;33m%}'%D{"%Y-%m-%d %I:%M:%S"}%b$'%{\e[0;31m%}]%b%{\e[0m%}%{\e[0m%}-%{\e[0;31m%}[%{\e[1;35m%}%?$(retcode)%{\e[0;31m%}]%{\e[0;34m%}$(mygit)$(hg_prompt_info)
%{\e[0;31m%}└─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;31m%}]>%b%{\e[0m%} '
PS2=$' \e[0;31m%}>%{\e[0m%}%b '

#%b%{\e[0;31m%}[%b%{\e[1;37m%}%~%{\e[0;31m%}]%b%{\e[0m%}
#<$(mygit)$(hg_prompt_info)>%{\e[0m%}%b
