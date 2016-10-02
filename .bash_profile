
# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in $HOME/.{extra,bash_prompt,exports,aliases,functions}; do
    [[ -r "$file" ]] && source "$file"
done
unset file

# to help sublimelinter etc with finding my PATHS
case $- in *i*)
    source "$HOME/.extra"
esac

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
eval "$(gdircolors -b ~/.dircolors)"

# generic colouriser
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
    then
        alias colourify="$GRC -es --colour=auto"
        alias configure='colourify ./configure'
        for app in {diff,make,gcc,g++,as,ping,head,tail,traceroute,dig,df,ps,mtr}; do
            alias "$app"='colourify '$app
    done
fi

##
## gotta tune that bash_history…
##

##
## hooking in other apps…
##
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"

export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# z beats cd most of the time.
#   github.com/rupa/z
source "$HOME/code/z/z.sh"

##
## Completion…
##
if [[ -n "$ZSH_VERSION" ]]; then  # quit now if in zsh
    return 1 2> /dev/null || exit 1;
fi;

# bash completion.
if  which brew > /dev/null && [[ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [[ -f "/etc/bash_completion" ]]; then
    source "/etc/bash_completion";
fi;

# homebrew completion
#if  which brew > /dev/null; then
#    source "$(brew --repository)/Library/Contributions/brew_bash_completion.sh"
#fi;

# nvm completion
if  [[ -f "$HOME/.nvm/bash_completion" ]]; then
    source  "$HOME/.nvm/bash_completion";
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
    __git_complete g __git_main
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Needed to autoinstall phpmyadmin/phppgadmin/etc...
PHP_AUTOCONF="$(brew --repository)/bin/autoconf"

##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

