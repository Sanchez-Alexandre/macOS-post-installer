function install () {
  echo "Installing $1 formula..."
  brew install $1
}
export -f install
<lists/formulae.txt xargs -I % sh -c 'install %'
