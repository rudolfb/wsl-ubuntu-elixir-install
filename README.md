# wsl-ubuntu-elixir-install

## Installation

Installs the prerequisites for Erlang, Elixir and Phoenix in Ubuntu on WSL including

- wxWidgets
- Postgres
- nodejs
- asdf
- rust

```bash
mkdir github
cd github
git clone https://github.com/rudolfb/wsl-ubuntu-elixir-install.git
cd wsl-ubuntu-elixir-install

chmod +x *.sh

./install.sh
exit
```

Automating the installation of ```asdf``` and then using ```asdf``` in the same session does not seem to work, so after installing ```asdf```, one needs to close and reopen the terminal, then continue with the installation.

```
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
sudo service postgresql start
sudo -u postgres psql
ALTER USER postgres PASSWORD 'postgres';
\q
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

Add the following code, ```CTRL+O``` to save, and ```CTRL+X``` to exit the file.

```
#!/bin/bash
sudo /usr/bin/start-postgresql
```

Now create the above referenced file.

```
sudo nano /usr/bin/start-postgresql
```

Add the following code, ```CTRL+O``` to save, and ```CTRL+X``` to exit the file.

```
#!/bin/bash
if pgrep -x postgres >/dev/null
then
  echo "postgresql service already started"
else
  sudo service postgresql start
fi
```

Now allow the ```start-postgresql``` script to run as a script:

```
sudo chmod +x /usr/bin/start-postgresql
```

Now, when starting Ubuntu, you will always be promted once for your admin password in order to start the ```postgresql``` service. Once Ubuntu is up and runing, opeing another Ubuntu terminal window will simply report that postgresql is already running.

To avoid having to enter your password every time Ubuntu opens for the first time, execute the following.

```
sudo visudo
```

Add the following to the end of the file, ```CTRL+O``` to save, and ```CTRL+X``` to exit the file.

```
%sudo ALL=NOPASSWD: /usr/bin/start-postgresql
zq ALL=(ALL) NOPASSWD: ALL
```

## VSCode
### Extentions for Elixir

- https://marketplace.visualstudio.com/items?itemName=JakeBecker.elixir-ls
- https://marketplace.visualstudio.com/items?itemName=pgourlain.erlang
- https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
- https://marketplace.visualstudio.com/items?itemName=ckolkman.vscode-postgres
- https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint
- https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss
- https://marketplace.visualstudio.com/items?itemName=ouven.vscode-yab-for-eex-leex
- https://marketplace.visualstudio.com/items?itemName=mrorz.language-gettext
- https://marketplace.visualstudio.com/items?itemName=RoyalMist.vscode-eex-format

### Extentions for CSV
- https://marketplace.visualstudio.com/items?itemName=GrapeCity.gc-excelviewer
- https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv

### Themes
- https://marketplace.visualstudio.com/items?itemName=kkalita.dark-plus-elixir

The following allows one to enter snippets inside of double quotes in a template:

```
"editor.quickSuggestions": {
        "comments": false,
        "other": true,
        "strings": true
    }
```

The following will allow the **html.eex** and **html.leex** template files to be interpreted as **html** files in VSCode:
```
"emmet.includeLanguages": {
    "html-eex": "html",
    "html-leex": "html"
}
```

`File >> Preferences >> Settings`

Then search for the tag name, e.g. **editor.quickSuggestions**, and assign the appropriate values.

### Adding project specific snippets:

`File >> Preferences >> User Snippets`

New snippets file for 'my_project'...

`elixir.json`

Paste the snippets into the JSON file. If you already
have snippets in that file, you'll need to put all the snippets in one
top-level JavaScript object, so remove the outer braces in the code
below.

JSON doesn't allow comments, so you must remove any comment lines!

## ~~DNS~~
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
