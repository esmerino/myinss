FROM mcr.microsoft.com/devcontainers/ruby

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev,.preview.app.github.dev,.app.github.dev"

RUN <<EOF
OS_RELEASE=$(. /etc/os-release && echo ${VERSION_CODENAME})
POSTGRES_REPO="http://apt.postgresql.org/pub/repos/apt/ $OS_RELEASE-pgdg main"
POSTGRES_KEYRING=/usr/share/keyrings/postgresql-keyring.gpg
curl -sS https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o $POSTGRES_KEYRING
echo "deb [signed-by=$POSTGRES_KEYRING] $POSTGRES_REPO" | tee /etc/apt/sources.list.d/postgresql.list
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt-get -y install --no-install-recommends postgresql-client chromium-driver libvips-dev
EOF
# [Optional] Uncomment this line to install additional gems.
# RUN su vscode -c "gem install <your-gem-names-here>"

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
