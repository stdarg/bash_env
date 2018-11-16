# For homebrew
export HOMEBREW_GITHUB_API_TOKEN="2b9291c4b1a2ee2121473aa7782d49a2b4dd214f"

# pyenv
export PYENV_ROOT=~/.pyenv
export PYENV_VERSION=3.6.5
export PYTHON_PATH=~/.pyenv/shims/python
export PIPENV_PYTHON=$PYENV_ROOT/shims/python
export DB_KEY=whatevs

export PIPENV_DOTENV_LOCATION=~/.arceo
export PIPENV_SHELL_FANCY=true

if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
fi

# jenv initilization
# jenv global 1.8
eval "$(jenv init -)"

# work-specific aliases
alias arceo="cd ~/arceo"
alias quoter="cd ~/arceo/quoter"
alias qq="cd ~/arceo/quoter/quoter"
alias qqt="cd ~/arceo/quoter/quoter/tests"
