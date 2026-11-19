alias ls "ls --color"
alias cat bat
alias egrep "grep -E"
# alias op "xdg-open"

function op
    xdg-open $argv &
end

abbr -a -- vimrc "vim ~/.vim/vimrc"

# start working on denksicht
abbr -a -- ds "cd ~/Documents/denkweit/git/DENKSicht && source .venv/bin/activate.fish && code ."

# git aliases
alias gs "git status"

abbr -a -- sv "source .venv/bin/activate.fish"
abbr -a -- svc "source .venv/bin/activate.fish && code ."

# for sather k  compilation
alias satk "env TERM=xterm satk"
alias mono "env TERM=xterm mono"

abbr -a -- fcam "fakecam -W 1920 -H 1080 --no-foreground --background-blur 50 -b ~/git/Linux-Fake-Background-Webcam/background.jpg"

abbr -a -- rebuild_ty "git pull && git -C ruff pull origin main && uv build --wheel --clear && uv tool install --reinstall dist/ty-0.0.*"

