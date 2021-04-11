ERLANG_VERSION=23.3.1
ELIXIR_VERSION=1.11.4-otp-23
RUST_VERSION=1.51.0
RUBY_VERSION=3.0.1

asdf update
asdf plugin update --all

LATEST_ERLANG_VERSION=$(asdf latest erlang)
LATEST_ELIXIR_VERSION=$(asdf latest elixir)
LATEST_RUST_VERSION=$(asdf latest rust)
LATEST_RUBY_VERSION=$(asdf latest ruby)

CURRENT_ERLANG_VERSION=$(asdf current erlang)
CURRENT_ELIXIR_VERSION=$(asdf current elixir)
CURRENT_RUST_VERSION=$(asdf current rust)
CURRENT_RUBY_VERSION=$(asdf current ruby)

echo ""
echo "Latest Erlang version: ${LATEST_ERLANG_VERSION}"
echo "Current Erlang version: ${CURRENT_ERLANG_VERSION}"
echo "Erlang version to install: ${ERLANG_VERSION}"
if [[ "${LATEST_ERLANG_VERSION}" != "${ERLANG_VERSION}" ]]
then
  echo ----- UPDATE GITHUB: Need to update github and modify the version of Erlang to install
fi

echo ""
echo "Latest Elixir version: ${LATEST_ELIXIR_VERSION}"
echo "Current Elixir version: ${CURRENT_ELIXIR_VERSION}"
echo "Elixir version to install: ${ELIXIR_VERSION}"
if [[ "${LATEST_ELIXIR_VERSION}" != "${ELIXIR_VERSION}" ]]
then
  echo ----- UPDATE GITHUB: Need to update github and modify the version of Elixir to install
fi

echo ""
echo "Latest Rust version: ${LATEST_RUST_VERSION}"
echo "Current Rust version: ${CURRENT_RUST_VERSION}"
echo "Rust version to install: ${RUST_VERSION}"
if [[ "${LATEST_RUST_VERSION}" != "${RUST_VERSION}" ]]
then
  echo ----- UPDATE GITHUB: Need to update github and modify the version of Rust to install
fi

echo ""
echo "Latest Ruby version: ${LATEST_RUBY_VERSION}"
echo "Current Ruby version: ${CURRENT_RUBY_VERSION}"
echo "Ruby version to install: ${RUBY_VERSION}"
if [[ "${LATEST_RUBY_VERSION}" != "${RUBY_VERSION}" ]]
then
  echo ----- UPDATE GITHUB: Need to update github and modify the version of Ruby to install
fi

echo ""

set -x

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
