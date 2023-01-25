# This script will guide you through setting up an 
# environment capable of hosting an Elixir+Phoenix app 
# with nginx and postgresql
# Targeting: Raspbery Pi 4B running Raspberry Pi OS Lite 64bit 2022-09-22
# Last Updated: 01/25/2023

# Raspbian defaults the locale to en-GB. Run below
# command to change this to en-US (or other)
# use space to key to (de)select locales from the list
sudo dpkg-reconfigure locales

# update apt and all preinstalled packages
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# git
sudo apt install -y git
git config --global init.defaultBranch main
git config --global user.name "awdenton"
git config --global user.email "awdenton@gmail.com"

# # generate ssh key for github
# # this will require some user input
# ssh-keygen -t ed25519 -C "awdenton@gmail.com"

# # don't forget the following
# # eval "$(ssh-agent -s)"
# # ssh-add ~/.ssh/<git_ssh_key_name>
# # and then add the .pub file to github

# asdf
# A Version Manager that manages our various language installs
# NOTE: Should already have curl and git installed at this point, but leaving here as 
#   a reminder they are needed by the asdf install
# sudo apt install -y curl git --
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

echo '' >> ~/.bashrc
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

asdf plugin add nodejs
asdf install nodejs 18.13.0
asdf global nodejs 18.13.0

asdf plugin add java
asdf install java openjdk-19.0.2
asdf global java openjdk-19.0.2

asdf plugin add erlang
# below packages are needed for the erlang install
sudo apt install -y libssl-dev automake autoconf libncurses5-dev erlang-wx erlang-odbc
asdf install erlang 25.2.1
asdf global erlang 25.2.1

asdf plugin add elixir
asdf install elixir 1.14.3-otp-25
asdf global elixir 1.14.3-otp-25

# nginx
sudo apt install -y nginx

# postgresql
sudo apt install -y postgresql

# elixir phoenix
sudo apt install -y inotify-tools
mix local.hex
mix archive.install hex phx_new