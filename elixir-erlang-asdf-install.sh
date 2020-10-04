ERLANGVERSION=23.1.1
ELIXIRVERSION=1.10.4-otp-23
RUSTVERSION=1.46.0
RUBYVERSION=2.7.1

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
