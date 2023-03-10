# This script will guide you through setting up an 
# environment capable of hosting an Elixir+Phoenix app 
# with nginx and postgresql
# Targeting: Ubuntu 22.04 LTS Desktop
# Last Updated: 01/25/2023

# update apt and all preinstalled packages

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# git

sudo apt install -y git
git config --global user.name "awdenton"
git config --global user.email "awdenton@gmail.com"

# generate ssh key for github
# this will require some user input
ssh-keygen -t ed25519 -C "awdenton@gmail.com"

# don't forget the following
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/<git_ssh_key_name>
# and then add the .pub file to github

# asdf
sudo apt install -y curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

# add the following th .bashrc
echo '' >> ~/.bashrc
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

asdf plugin add nodejs
asdf install nodejs 16.19.0
asdf install nodejs 18.13.0
asdf global nodejs 18.13.0

asdf plugin add erlang
asdf install erlang 25.2.1
asdf global erlang 25.2.1

asdf plugin add elixir
asdf install elixir 1.14.3-otp-25
asdf global elixir 1.14.3-otp-25

# postgresql

sudo apt install -y postgresql

# elixir phoenix

sudo apt install -y inotify-tools
mix local.hex
mix archive.install hex phx_new


# vs code

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code