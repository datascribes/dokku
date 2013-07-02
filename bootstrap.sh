set -e
export DEBIAN_FRONTEND=noninteractive
export DOKKU_REPO=${DOKKU_REPO:-"https://github.com/progrium/dokku.git"}

apt-get update
apt-get install -y git make curl

cd ~ && git clone ${DOKKU_REPO}
cd dokku && make install-all

echo
echo "Be sure to upload a public key for your user:"
echo "  cat ~/.ssh/id_rsa.pub | ssh root@$HOSTNAME \"gitreceive upload-key progrium\""
