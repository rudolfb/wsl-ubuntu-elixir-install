# wsl-ubuntu-elixir-install

## Installation

```bash
mkdir github
cd github
git clone https://github.com/rudolfb/wsl-ubuntu-elixir-install.git
cd wsl-ubuntu-elixir-install

chmod +x *.sh

./install.sh
exit
cd ~/github/wsl-ubuntu-elixir-install/
./elixir-erlang-asdf-install.sh
./phoenix-install.sh
```

## Update
```bash
./update.sh
./elixir-erlang-asdf-install.sh
./phoenix-install.sh
```

## WSL version 2 is a lot faster than WSL version 1
```
wsl --set-default-version 2
wsl --list --verbose
wsl --set-version Ubuntu 2
```

## Assigning a password for Postgres after Postgres installation
```
sudo su - postgres
psql -c "alter user postgres with password 'postgres'"
```

Then in the Elixir **/config/dev.exs** assign the password:

```
# Configure your database
config :agento, Agento.Repo,
  username: "postgres",
  password: "postgres",
```

## Start postgresql service automatically when WSL opens
Currently, when you start WSL, services will not automatically start. Here a workaround.

```
sudo nano /etc/profile.d/start-postgresql.sh
```

Add the follwing code, **CTRL+O** to save, and **CTRL+X** to exit the file.

```
#!/bin/bash
sudo /usr/bin/start-postgresql
```

Now create the above referenced file.

```
sudo nano /usr/bin/start-postgresql
```

Add the follwing code, **CTRL+O** to save, and **CTRL+X** to exit the file.

```
#!/bin/bash
if pgrep -x postgres >/dev/null
then
  echo "postgresql already started"
else
  sudo service postgresql start
fi
```

Now, when starting Ubuntu, you will always be promted once for your admin password in order to start the postgresql service. Once Ubuntu is up and runing, opeing another Ubuntu terminal window will simply report that postgresql is already running.

To avoid having to enter your password every time Ubuntu opens for the first time, execute the following.

```
sudo visudo
```

Add the follwing to the end of the file, **CTRL+O** to save, and **CTRL+X** to exit the file.

```
%sudo ALL=NOPASSWD: /usr/bin/start-postgresql
zq ALL=(ALL) NOPASSWD: ALL
```

## DNS
~~Since Ubuntu 20 the DNS seems to have an issue. The following lines set a hard coded DNS server and resolves the issue:~~

```bash
sudo su -c "echo '[network]' > /etc/wsl.conf"
sudo su -c "echo 'generateResolvConf = false' >> /etc/wsl.conf"
sudo nano /etc/wsl.conf

sudo nano /etc/resolve.conf
# nameserver 8.8.8.8
```

```bash
sudo rm /etc/resolv.conf
sudo unlink /etc/resolv.conf
sudo bash -c "echo nameserver 192.168.188.1 > /etc/resolv.conf"
sudo bash -c "echo nameserver 8.8.8.8 >> /etc/resolv.conf"
```
