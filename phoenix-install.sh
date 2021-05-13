set -x

mix do local.hex --force , \
  local.rebar --force , \
  archive.install hex phx_new 1.5.9 --force
mix do local.phx --force
mix hex.info
set +x
CURRENT_PHOENIX_VERSION=$(mix phx.new -v)
echo "Current phoenix version: ${CURRENT_PHOENIX_VERSION}"
