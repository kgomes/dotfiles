# ZShell environment variables. This is the first thing that gets sourced in the chain of
# configuration files. This is where environment variables go
echo "Sourcing .zshenv"
# Check to see if Homebrew is in /opt/homebrew and if so, set some environment variables
# and paths as they will not be set by default. Old versions of Homebrew may not have this
# problem as they are in /usr/local so they are included automatically.
if [ -d /opt/homebrew ]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
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

echo "PATH: $PATH"
echo "Finished sourcing .zshenv"
