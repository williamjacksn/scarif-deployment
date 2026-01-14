# set up ssh
install -D .ssh/config ~/.ssh/config
install --mode=600 -D /dev/null ~/.ssh/id_ed25519
echo "${SSH_PRIVATE_KEY}" > ~/.ssh/id_ed25519
ssh-keyscan -H scarif.subtlecoolness.com > ~/.ssh/known_hosts

docker context create scarif --docker "host=ssh://scarif"
docker context use scarif
docker compose --project-name scarif up --build --detach --remove-orphans
