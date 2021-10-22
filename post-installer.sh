#!/bin/sh

if ! xcode-select -p 1>/dev/null
then
  echo "Installing macOS command line tools..."
  xcode-select --install
  read -p "Press RETURN to continue..."
fi

if test ! $(which brew)
then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

function install () {
  echo "Tapping $1..."
  brew tap $1
}
export -f install
<lists/taps.txt xargs -I % sh -c 'install "%"'

function install () {
  echo "Installing $1 formula..."
  brew install $1
}
<lists/formulae.txt xargs -I % sh -c 'install "%"'
install "mas"

function install () {
  echo "Installing $1 cask..."
  brew install --cask $1
}
<lists/casks.txt xargs -I % sh -c 'install "%"'

function install () {
  echo "Installing $1 app..."
  mas search "$1" | { read appid app_name ; mas install $appid ; }
}
<lists/apps.txt xargs -I % sh -c 'install "%"'

echo "Generating SSH key..."
ssh-keygen -t ed25519 -a 128

echo "Setting GPG..."
mkdir ~/.gnupg
chmod 700 ~/.gnupg
cp configs/gpg.conf ~/.gnupg/gpg.conf
cp configs/gpg-agent.conf ~/.gnupg/gpg-agent.conf
gpgconf --reload gpg-agent

echo "Setting fish..."
mkdir -p ~/.config/fish
cp configs/config.fish ~/.config/fish/config.fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)

echo "Setting Git..."
git config --global init.defaultBranch "main"
echo "Name:"
read name
git config --global user.name "$name"
echo "Email:"
read email
git config --global user.email "$email"

echo "Setting system..."
# Allow unindentified developer's apps
sudo spctl --master-disable
# Prevent .DS_Store file creation
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Set TextEdit default files to plain text
defaults write com.apple.TextEdit RichText -int 0

echo "Clean up..."
brew cleanup --prune 0
