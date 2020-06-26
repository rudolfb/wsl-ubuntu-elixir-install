set -x

# wsl --list --verbose
# wsl --set-version Ubuntu-18.04 2

# chmod +x install.sh
# chmod +x *.sh

sudo apt -y update
sudo apt -y upgrade

sudo apt -y install git libgtk-3-dev \
  libglu1-mesa-dev freeglut3-dev mesa-common-dev \
  build-essential make
mkdir ~/github
cd ~/github
git clone --branch WX_3_0_3_BRANCH https://github.com/wxWidgets/wxWidgets.git
cd ~/github/wxWidgets/
./configure --with-gtk --with-opengl --disable-optimise --enable-utf8 --enable-stc --enable-compat28 --prefix=/usr/local --enable-debug_info --enable-ipc
make && sudo make install
# export PATH=/usr/local/bin:$PATH
cd ~

sudo apt -y install libssl-dev make \
  automake autoconf libncurses5-dev \
  gcc unzip \
  git nano inotify-tools curl wget \
  traceroute net-tools whois libxml2-utils\
  default-jdk  \
  curl dirmngr apt-transport-https lsb-release ca-certificates \
  build-essential autoconf \
  m4 libncurses5-dev libgl1-mesa-dev \
  libglu1-mesa-dev libpng-dev libssh-dev \
  unixodbc-dev xsltproc fop

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

sudo apt -y install nodejs

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install postgresql-client-12
sudo apt -y install postgresql-12
# sudo service postgresql start

# sudo apt -y install libwxgtk3.0-dev

# Ubuntu 20.04 LTS does not have this package for Erlang
# Need to install from source:
# https://www.wxwidgets.org/downloads/
# https://wiki.codelite.org/pmwiki.php/Main/WxWidgets31Binaries#toc2

# sudo apt-add-repository 'deb https://repos.codelite.org/wx3.1.3/ubuntu/ focal universe'
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6856E1DB1AC82609
# sudo apt -y update
# sudo apt -y install libwxbase3.1-0-unofficial3 \
#                  libwxbase3.1unofficial3-dev \
#                  libwxgtk3.1-0-unofficial3 \
#                  libwxgtk3.1unofficial3-dev \
#                  wx3.1-headers \
#                  wx-common

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
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

# ./elixir-erlang-asdf-install.sh

# ./phoenix-install.sh

# post installation steps
# After this script you might want to execute
# source ~/.bashrc
# in the interactive shell, to load the asdf scripts.
# Or close the shell and open a new shell.
# There might be a port conflict with Postgres when installed in
# an Ubuntu WSL session and Windows. If there is, the installation in WSL
# will assign a different port, e.g. 5433
# You will need to take this into account in Elixir when defining
# the logon information for Postgres.
#To change the port in Ubuntu:
# sudo nano /etc/postgresql/*/main/postgresql.conf
# This will find and open the postgresql.conf
# Change the port to 2345, CTRL+O to save and CTRL+X to exit.
# sudo service postgresql start
# sudo su - postgres
# psql -c "alter user postgres with password 'postgres'"
# Modify your Exlixir dev.exs, adding an appropriate
# port: to the Repo config.
