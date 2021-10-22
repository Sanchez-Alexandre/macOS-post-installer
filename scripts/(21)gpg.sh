echo "Setting GPG..."
mkdir ~/.gnupg
chmod 700 ~/.gnupg
cp configs/gpg.conf ~/.gnupg/gpg.conf
cp configs/gpg-agent.conf ~/.gnupg/gpg-agent.conf
gpgconf --reload gpg-agent
