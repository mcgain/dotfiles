echo ".bash_profile"
export PATH="$HOME/.cargo/bin:$PATH"

source /home/mcgain/.config/broot/launcher/bash/br
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
umask 002
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

if [ -t 1 ]; then
	echo "execcing zsh"
	exec zsh
fi
