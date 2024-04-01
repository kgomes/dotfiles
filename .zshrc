#
# .zshrc
#
# Author: Kevin Gomes (a lot of this comes from Jeff Geerling)

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Don't require escaping globbing characters in zsh.
unsetopt nomatch

# Nicer prompt.
export PS1=$'\n'"%F{green} %*%F %3~ %F{white}"$'\n'"$ "

# Enable plugins.
plugins=(git brew history history-substring-search)

# Set custom PATH
export PATH="${HOME}/Library/Python/3.9/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:${HOME}/bin:${HOME}/.cargo/bin:${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Configure history command
HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE

# Define some handy aliases
alias ll="ls -lah"
alias dcmp="docker-compose"
alias lt="ls -latr"
alias hist="history 1"
alias histg="history | grep"

# Check architecture of Mac
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    share_path="/usr/local/share"
elif [ "${arch_name}" = "arm64" ]; then
    share_path="/opt/homebrew/share"
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
else
    echo "Unknown architecture: ${arch_name}"
fi

# Set up jEnv to manage java versions
eval "$(jenv init -)"

# Define the root directory for Pyenv
export PYENV_ROOT="$HOME/.pyenv"

# Setup pyenv
export PATH=$(pyenv root)/shims:$PATH
if command -v pyenv &>/dev/null; then
    eval "$(pyenv init -)"
fi
if command -v pyenv-virtualenv &>/dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi

# Define the home location for NVM
export NVM_DIR="$HOME/.nvm"

# Set up nvm to manage node versions
source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix nvm)/etc/bash_completion.d/nvm

#echo "PATH:"
#tr ':' '\n' <<< "$PATH"
