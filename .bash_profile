echo "inside sourcing .bash_profile"
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
echo "sourcing .bashrc"
source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /Users/richardmcgain/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/richardmcgain/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
