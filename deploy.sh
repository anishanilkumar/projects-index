#!/bin/sh
# Ship the page to the web server over SSH (rsync into the vhost's web root).
# The target comes from .deploy.env (gitignored; see .deploy.env.example), so
# no server address lives in the repo.
set -eu
cd "$(dirname "$0")"
[ -f .deploy.env ] || { echo "Missing .deploy.env: copy .deploy.env.example and fill it in." >&2; exit 1; }
. ./.deploy.env
: "${DEPLOY_HOST:?set in .deploy.env}" "${DEPLOY_DIR:?set in .deploy.env}"
rsync -av --delete index.html fonts "$DEPLOY_HOST:$DEPLOY_DIR/"
echo "Deployed: https://projects.anishsheela.com"
