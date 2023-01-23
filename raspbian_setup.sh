mkdir ~/repos

sudo dpkg-reconfigure locales

# update apt and all preinstalled packages

sudo apt update
sudo apt upgrade -y
sudo apt install -y autoconf automake coreutils curl g++ gcc git gpg inotify-tools libncurses5-dev libssl-dev make nginx postgresql wget
sudo apt autoremove -y

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
# NOTE: Should already have curl and git installed at this point, but leaving here as 
#   a reminder they are needed
# sudo apt install -y curl git --
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

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
# elixir phoenix

mix local.hex
mix archive.install hex phx_new