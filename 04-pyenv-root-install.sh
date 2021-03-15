#############################################################
# PYENV ROOT INSTALL - USES PYENV INSTALLER SCRIPT
# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-installer
# Pyenv for root is required for tools like mitm6 which need to be installed and run as root

# Install Python build dependancies
apt update; apt install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Set up bashrc for pyenv
cat << EOF >> /root/.bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

# Source the bashrc having made the changes
source /root/.bashrc

# Curl and execute installer script
cd /root
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Install a 3.x and a 2.x version of python
pyenv install 3.9.1
pyenv install 2.7.18

exec $SHELL
