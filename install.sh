# wsl --list --verbose
# wsl --set-version Ubuntu-18.04 2

# chmod +x install.sh
# chmod +x *.sh

sudo apt -y update
sudo apt -y upgrade

sudo apt -y install \
  git nano inotify-tools curl wget \
  traceroute net-tools whois libxml2-utils\
  default-jdk

sudo apt -y update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt -y install nodejs

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install postgresql-client-12
sudo apt -y install postgresql-12
# sudo service postgresql start

sudo apt -y install build-essential autoconf \
  m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev \
  libglu1-mesa-dev libpng-dev libssh-dev \
  unixodbc-dev xsltproc fop

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
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

./elixir-erlang-asdf-install.sh

./phoenix-install.sh

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
