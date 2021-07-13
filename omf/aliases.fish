alias ls "ls --color"
alias cat bat
# alias op "xdg-open"

function op
    xdg-open $argv &
end

alias vimrc "vim ~/.vim/vimrc"

# start working on denksichtalt
alias dsalt "cd ~/Documents/denk/DenkSichtAlt ; conda activate denksichtalt ; vim"

# git aliases
alias gs "git status"

# for sather k  compilation
alias satk "env TERM=xterm satk"
alias mono "env TERM=xterm mono"

alias fcam "fakecam -W 1920 -H 1080 --no-foreground --background-blur 50 -b ~/git/Linux-Fake-Background-Webcam/background.jpg"

