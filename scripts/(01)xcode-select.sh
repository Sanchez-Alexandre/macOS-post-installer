if ! xcode-select -p 1>/dev/null
then
  echo "Installing macOS command line tools..."
  xcode-select --install
  read -p "Press enter when install done..."
fi
