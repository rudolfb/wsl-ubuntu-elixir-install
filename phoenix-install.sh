set -x

mix do local.hex --force , \
  local.rebar --force , \
  archive.install hex phx_new 1.6.6 --force
mix do local.phx --force
mix hex.info
set +x
CURRENT_PHOENIX_VERSION=$(mix phx.new -v)
LATEST_PHOENIX_VERSION=$(curl -s "https://api.github.com/repos/phoenixframework/phoenix/tags" | jq -r '.[0].name')
echo "Currently installed phoenix version: ${CURRENT_PHOENIX_VERSION}"
echo "Latest available phoenix version:            ${LATEST_PHOENIX_VERSION}"
