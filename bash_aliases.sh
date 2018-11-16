# Some useful aliases.

alias s="git status -s"
alias sb='source ~/.profile'
alias vb='vi ~/src/dotfiles/bashrc.sh'
alias vp='vi ~/src/dotfiles/profile.sh'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
alias printn='/usr/bin/lp -o nobanner -d $LPDEST'   # Assumes LPDEST is defined
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias du='du -kh'
alias df='df -kTh'

# The 'ls' family (this assumes you use the GNU ls)
alias la='ls -AlG'          # show hidden files
alias ls='ls -hF -G'        # add colors for filetype recognition
alias lx='ls -lXBG'         # sort by extension
alias lk='ls -lSrG'         # sort by size
alias lc='ls -lcrG'         # sort by change time
alias lu='ls -lurG'         # sort by access time
alias lr='ls -lRG'          # recursive ls
alias lt='ls -ltrG'         # sort by date
alias lm='ls -alG |more'    # pipe through 'more'
alias tree='tree -Csu'      # nice alternative to 'ls'
alias l='ls -hF -G'
alias countjs="find . -name "*.js" -exec cat \{\} \; | wc -l"
alias countpy="find . -name "*.py" -exec cat \{\} \; | wc -l"
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"

# spelling typos - highly personal :-)
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'

alias grepjsi="grep --include='*.js' -nir "
alias grepjs="grep --include='*.js' -nr "
alias greppyi="grep --include='*.py' -nir "
alias greppy="grep --include='*.py' -nr "
alias grepc="grep --include='*.h' --include='*.c' -nir "
alias makectags='find . | grep -v node_modules | grep ".js$" | xargs ctags --tag-relative=yes --fields=+akst'
alias notabs="find ./ -type f -exec sed -i 's/\t/    /g' {} \;"
alias src="cd ~/src"
alias weather="ansiweather"

function jscountall() {
    local DIR="."
    if ! [ -z "$@" ]
    then
        DIR="$@"
    fi
    find "$DIR" -name *.js | xargs cat 2> /dev/null | wc -l
}

function jscount() {
    local DIR="."
    if ! [ -z "$@" ]
    then
        DIR="$@"
    fi
    find "$DIR" \( -name node_modules -prune \) -o -name "*.js" | xargs cat 2> /dev/null | wc -l
}

function pygrep() {
    find . \( -name __pycache__ -prune \) -o -name "*.py" -exec grep --color -Hn "$@" {} 2>/dev/null \;
}

function jsgrep() {
    find . \( -name node_modules -prune \) -o -name "*.js" -exec grep --color -Hn "$@" {} 2>/dev/null \;
}

function javagrep() {
    find . \( -name node_modules -prune \) -o -name "*.java" -exec grep --color -Hn "$@" {} 2>/dev/null \;
}

function grepjs() {
    find . \( -name node_modules -prune \) -o -name "*.js" -exec grep --color -Hn "$@" {} 2>/dev/null \;
}

function vi()    { echo -e "\033];$@\007"; /usr/local/bin/vim $@; echo -e "\033];\007"; }
function vp()    { vi `grep "$@" * | cut -f1 -d: | sort -u`; }
function vcpp()  { vi `grep "$@" *.cpp *.h | cut -f1 -d: | sort -u`; }
function vjs()   { vi `grep "$@" *.js | cut -f1 -d: | sort -u`; }
function vp2()   { vi `grep "$@" *.php *.inc | cut -f1 -d: | sort -u`; }
function rgrep   { find . -exec grep -iHn "$@" \{\} \;; }
function fvi()   { find . -name "$@" -exec vi \{\} \; ; }
function pjson() { echo $@ | python -mjson.tool ; }
function vijs()  { vi `grep -nr "$@" *.js  | cut -d: -f1 | sort -u` ; }
function vipy()  { vi `grep -nr "$@" *.py  | cut -d: -f1 | sort -u` ; }

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

armaggedon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}
