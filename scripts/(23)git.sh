echo "Setting Git..."
git config --global init.defaultBranch "main"

echo "Name:"
read name
git config --global user.name "$name"

echo "Email:"
read email
git config --global user.email "$email"
