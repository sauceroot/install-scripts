#############################################################
# PYENV ROOT INSTALL - USES PYENV INSTALLER SCRIPT
# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-installer
# Pyenv for root is required for tools like mitm6 which need to be installed and run as root

# Curl and execute installer script
cd /root
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Set up bashrc for pyenv
cat << EOF >> /root/.bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

pyenv install 3.9.1
pyenv install 2.7.18
