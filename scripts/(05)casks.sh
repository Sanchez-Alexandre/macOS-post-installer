function install () {
  echo "Installing $1 cask..."
  brew install --cask $1
}
export -f install
<lists/casks.txt xargs -I % sh -c 'install %'
