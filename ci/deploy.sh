install --mode=600 -D /dev/null ~/.ssh/id_ed25519
echo "${SSH_PRIVATE_KEY}" > ~/.ssh/id_ed25519
cp ci/ssh_config ~/.ssh/config
ssh-keyscan -H scarif.subtlecoolness.com > ~/.ssh/known_hosts
scp Caddyfile scarif:/home/rocky/caddy/etc/caddy
docker --host ssh://scarif compose --project-name scarif up --detach --pull always --remove-orphans
