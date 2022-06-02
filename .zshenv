# ZShell environment variables. This is the first thing that gets sourced in the chain of
# configuration files. This is where environment variables go

# Check to see if Homebrew is in /opt/homebrew and if so, set some environment variables
# and paths as they will not be set by default. Old versions of Homebrew may not have this
# problem as they are in /usr/local so they are included automatically.
if [ ! -d /opt/homebrew ]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi

# Include jEnv on the path
export PATH="$HOME/.jenv/bin:$PATH"

# Define the home location for NVM
export NVM_DIR="$HOME/.nvm"

# Define the root directory for Pyenv
export PYENV_ROOT="$HOME/.pyenv"
