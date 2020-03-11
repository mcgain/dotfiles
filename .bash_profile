echo ".bash_profile"
if [ -t 1 ]; then
	echo "execcing zsh"
	exec zsh
fi

export PATH="$HOME/.cargo/bin:$PATH"

source /home/mcgain/.config/broot/launcher/bash/br
