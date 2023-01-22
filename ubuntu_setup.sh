mkdir ~/repos

# update apt and all preinstalled packages

apt update
apt upgrade -y

# git

apt install -y git

git config --global user.name "awdenton"
git config --global user.email "awdenton@gmail.com"

# generate git ssh key
# this will require some user input
ssh-keygen -t ed25519 -C "awdenton@gmail.com"

# don't forget the following
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/<git_ssh_key_name>

# vs code

sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -y -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code

# elixir

apt install -y elixir

# node

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install 16.19.0
nvm install 18.13.0
