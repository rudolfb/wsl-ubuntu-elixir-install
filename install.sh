sudo apt -y update
sudo apt -y upgrade

# erlang
sudo apt -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop

# additional tools
sudo apt -y install git nano inotify-tools curl vim bash-completion wget traceroute net-tools whois libxml2-utils default-jdk dirmngr apt-transport-https lsb-release ca-certificates gnupg jq

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt -y install nodejs

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg-testing main 13" |sudo tee  /etc/apt/sources.list.d/pgdg-testing.list

sudo apt -y update
sudo apt -y install postgresql-client-13
sudo apt -y install postgresql-13

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

it clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
# echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
# echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
# The following ensures the line is appended only if it does not exist
cd ~
FILE='.bashrc'
LINE='. $HOME/.asdf/asdf.sh'
grep -xqF -- "$LINE" "$FILE" || echo -e "\n$LINE" | tee --append "$FILE"
LINE='. $HOME/.asdf/completions/asdf.bash'
grep -xqF -- "$LINE" "$FILE" || echo -e "\n$LINE" | tee --append "$FILE"
# source ~/.bashrc
# The "source ~/.bashrc" command will only work in the shell's interactive mode
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
# asdf list-all erlang

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
# asdf list-all elixir

# Need rust for meeseeks
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
# asdf list-all rust

# Need ruby for htmlbeautifier
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
# asdf list-all ruby
