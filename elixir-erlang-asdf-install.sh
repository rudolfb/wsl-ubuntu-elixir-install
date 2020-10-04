set -x

ERLANGVERSION=23.1.1
asdf latest erlang
ELIXIRVERSION=1.10.4-otp-23
asdf latest elixir
RUSTVERSION=1.46.0
asdf latest rust
RUBYVERSION=2.7.1
asdf latest ruby

asdf plugin update --all

asdf plugin update erlang
asdf install erlang $ERLANGVERSION
asdf global erlang $ERLANGVERSION

asdf plugin update elixir
asdf install elixir $ELIXIRVERSION
asdf global elixir $ELIXIRVERSION

asdf plugin update rust
asdf install rust $RUSTVERSION
asdf global rust $RUSTVERSION

asdf plugin update ruby
asdf install ruby $RUBYVERSION
asdf global ruby $RUBYVERSION
gem install htmlbeautifier
gem update htmlbeautifier

# asdf list-all ruby | grep -i "^[0-9]"
