# wsl-ubuntu-elixir-install

```
wsl --list --verbose
wsl --set-version Ubuntu-18.04 2
```

```
sudo printf '[network]\ngenerateResolvConf = false' > /etc/wsl.conf

sudo nano /etc/resolve.conf
# nameserver 8.8.8.8

mkdir github
cd github
git clone https://github.com/rudolfb/wsl-ubuntu-elixir-install.git
cd wsl-ubuntu-elixir-install

# chmod +x install.sh
chmod +x *.sh

./install.sh
./elixir-erlang-asdf-install.sh
./phoenix-install.sh
```
