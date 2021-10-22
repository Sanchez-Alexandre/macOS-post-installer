echo "Setting fish..."
mkdir -p ~/.config/fish
cp configs/config.fish ~/.config/fish/config.fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)
