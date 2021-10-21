#!/bin/bash
echo "Welcome on your new Mac!"

echo "Installing macOS command line tools (xcode-select)..."
xcode-select --install
read -p "Press enter when install done! ..."

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing Homebrew packages..."
brew install \
  bash \
  fish \
  gh \
  git \
  gnupg \
  htop \
  jq \
  makeicns \
  node \
  python \
  wget
brew tap homebrew/cask-fonts
brew install --cask \
  anydesk \
  appcleaner \
  balenaetcher \
  discord \
  firefox \
  font-jetbrains-mono \
  github \
  gpg-suite \
  grandperspective \
  informant \
  inkscape \
  insomnia \
  macs-fan-control \
  minecraft \
  pictogram \
  protonvpn \
  robo-3t \
  sf-symbols \
  symboliclinker \
  visual-studio-code \
  vlc

echo "Generating SSH key..."
ssh-keygen -t ed25519 -a 128

echo "Setting GPG..."
mkdir ~/.gnupg
chmod 700 ~/.gnupg
cp ./gpg.conf ~/.gnupg/gpg.conf
cp ./gpg-agent.conf ~/.gnupg/gpg-agent.conf
gpgconf --reload gpg-agent

echo "Setting fish..."
mkdir -p ~/.config/fish
cp ./config.fish ~/.config/fish/config.fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)

echo "Setting some stuff..."
git config --global user.name "Dorian Eydoux"
git config --global user.name "loaves_pickle0@icloud.com"
git config --global init.defaultBranch "main"
sudo spctl --master-disable
