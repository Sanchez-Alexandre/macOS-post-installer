#!/bin/bash
echo "Here we will enable Git commit signing with a GPG key"

echo "GPG keys"
gpg -K --keyid-format SHORT

echo "Example: sec   rsa4096/######## YYYY-MM-DD [SC] [expires: YYYY-MM-DD]"
echo "Enter the ID of the GPG key you want to use for signing commits:"
read keyid

git config --global commit.gpgsign "true"
git config --global user.signingkey "$keyid"
