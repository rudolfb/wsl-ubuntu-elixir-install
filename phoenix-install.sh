set -x

mix do local.hex --force , \
  local.rebar --force , \
  archive.install hex phx_new 1.5.5 --force
mix do local.phx --force
mix hex.info
  
set -x
