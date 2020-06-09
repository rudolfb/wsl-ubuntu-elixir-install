mix do local.hex --force , \
  local.rebar --force , \
  archive.install hex phx_new 1.5.3 --force
mix do local.phx --force
