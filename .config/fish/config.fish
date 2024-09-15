if status is-interactive
    set -gx PATH $PATH /home/arcx/.cargo/bin/
    # Commands to run in interactive sessions can go here
end

function ex
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xvjf $argv[1]
            case '*.tar.gz'
                tar xvzf $argv[1]
            case '*.tar.xz'
                tar xvfJ $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xvf $argv[1]
            case '*.tbz2'
                tar xvjf $argv[1]
            case '*.tgz'
                tar xvzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "'$argv[1]' Не может быть распакован при помощи >ex<"
        end
    else
        echo "'$argv[1]' не является допустимым файлом"
    end
end


function venv
    source .venv/bin/activate.fish
end

alias cat="bat"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rsnc"
alias update="sudo pacman -Suy"
alias search="sudo pacman -Ss"
alias wifiu="nmtui"
alias l="exa -lr --no-user --icons --git"
alias ls="exa -l --no-user --icons --git"
alias ld="exa -lD --no-user --icons --git"
alias lt="exa --tree --no-user --git --icons"
alias la="exa -la --no-user --git --icons"
alias lg="exa -la --no-user --git --git-repos --icons "
#alias venv="python -m venv venv; source venv/bin/activate"
alias activate="source venv/bin/activate.fish"
alias poweroff="shutdown -h now"
alias wifi="nmcli device wifi connect Wive-NG-MT password 12121212"
alias cl="clear"
alias hyber="sudo systemctl hibernate"
alias sleep="systemctl suspend"
alias del="rm -rf"
alias Pomodoro="python ~/.local/bin/Pomodoro.py"
alias photo="qview"
alias n="nvim"
alias wall="python ~/bin/wallpapers.py"
export EDITOR="nvim"
# Created by `pipx` on 2024-01-10 16:18:04
set PATH $PATH /home/arcx/.local/bin
export BAT_THEME="TwoDark"
export FFF_HIDDEN=1

zoxide init fish --cmd cd | source
