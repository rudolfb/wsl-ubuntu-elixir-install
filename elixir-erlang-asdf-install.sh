LATEST_ERLANG_VERSION=$(asdf latest erlang)
LATEST_ELIXIR_VERSION=$(asdf latest elixir)
LATEST_RUST_VERSION=$(asdf latest rust)
LATEST_RUBY_VERSION=$(asdf latest ruby)

set -x

ERLANG_VERSION=23.1.1
echo "Latest Erlang version: ${LATEST_ERLANG_VERSION}"
ELIXIR_VERSION=1.10.4-otp-23
echo "Latest Elixir version: ${LATEST_ELIXIR_VERSION}"
RUST_VERSION=1.46.0
echo "Latest Rust version: ${LATEST_RUST_VERSION}"
RUBY_VERSION=2.7.1
echo "Latest Ruby version: ${LATEST_RUBY_VERSION}"

asdf plugin update --all

asdf plugin update erlang
asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION

asdf plugin update elixir
asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION

asdf plugin update rust
asdf install rust $RUST_VERSION
asdf global rust $RUST_VERSION

asdf plugin update ruby
asdf install ruby $RUBY_VERSION
asdf global ruby $RUBY_VERSION
gem install htmlbeautifier
gem update htmlbeautifier

set +x

# asdf list-all ruby | grep -i "^[0-9]"
