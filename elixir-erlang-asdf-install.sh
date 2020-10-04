LATESTERLANGVERSION=$(asdf latest erlang)
LATESTELIXIRVERSION=$(asdf latest elixir)
LATESTRUSTVERSION=$(asdf latest rust)
LATESTRUBYVERSION=$(asdf latest ruby)

set -x

ERLANGVERSION=23.1.1
echo "Latest Erlang version: ${LATESTERLANGVERSION}"
ELIXIRVERSION=1.10.4-otp-23
echo "Latest Elixir version: ${LATESTELIXIRVERSION}"
RUSTVERSION=1.46.0
echo "Latest Rust version: ${LATESTRUSTVERSION}"
RUBYVERSION=2.7.1
echo "Latest Ruby version: ${LATESTRUBYVERSION}"

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
