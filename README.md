# wsl-ubuntu-elixir-install


WSL version 2 is a lot faster than WSL version 1
```
wsl --set-default-version 2
wsl --list --verbose
wsl --set-version Ubuntu 2
```

Since Ubuntu 20 the DNS seems to have an issue. The following lines set a hard coded DNS server and resolves the issue:

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

Installation steps

```bash
mkdir github
cd github
git clone https://github.com/rudolfb/wsl-ubuntu-elixir-install.git
cd wsl-ubuntu-elixir-install

# chmod +x install.sh
chmod +x *.sh

./install.sh
exit
cd ~/github/wsl-ubuntu-elixir-install/
./elixir-erlang-asdf-install.sh
./phoenix-install.sh
```
