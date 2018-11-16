WHITE="\[\e[97m\]"
RED="\[\e[91m\]"
YELLOW="\[\e[93m\]"
DEFAULT="\[\e[39m\]"

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]
then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    GIT_PROMPT_THEME=Solarized
    GIT_PROMPT_START="${YELLOW}arceo ${WHITE}\w${DEFAULT}"
    GIT_PROMPT_END=" ${RED}$ ${DEFAULT}"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi
