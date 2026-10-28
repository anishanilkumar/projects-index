#!/bin/sh
# Ship the page to the NixOS server. The vhost lives in ~/projects/infra/nixos_config
# (configuration.nix); sms-inbox.nix there also serves this web root's fonts/.
set -eu
cd "$(dirname "$0")"
HOST="${PROJECTS_HOST:?set PROJECTS_HOST=user@host}"
rsync -av --delete index.html fonts "$HOST:/var/www/projects.anishsheela.com/"
echo "Deployed: https://projects.anishsheela.com"
