ERLANG_VERSION=23.1.1
ELIXIR_VERSION=1.11.0-otp-23
RUST_VERSION=1.46.0
RUBY_VERSION=2.7.2

LATEST_ERLANG_VERSION=$(asdf latest erlang)
LATEST_ELIXIR_VERSION=$(asdf latest elixir)
LATEST_RUST_VERSION=$(asdf latest rust)
LATEST_RUBY_VERSION=$(asdf latest ruby)

echo ""
echo "Erlang: ${ERLANG_VERSION}"
echo "Latest Erlang version: ${LATEST_ERLANG_VERSION}"
echo ""
echo "Elixir: ${ELIXIR_VERSION}"
echo "Latest Elixir version: ${LATEST_ELIXIR_VERSION}"
echo ""
echo "Rust: ${RUST_VERSION}"
echo "Latest Rust version: ${LATEST_RUST_VERSION}"
echo ""
echo "Ruby: ${RUBY_VERSION}"
echo "Latest Ruby version: ${LATEST_RUBY_VERSION}"
echo ""

set -x

asdf plugin update --all

asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION

asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION

asdf install rust $RUST_VERSION
asdf global rust $RUST_VERSION

asdf install ruby $RUBY_VERSION
asdf global ruby $RUBY_VERSION

gem install htmlbeautifier
gem update htmlbeautifier

set +x

# asdf list-all ruby | grep -i "^[0-9]"
