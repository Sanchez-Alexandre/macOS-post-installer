function tap () {
  echo "Tapping $1..."
  brew tap $1
}
export -f tap
<lists/taps.txt xargs -I % sh -c 'tap %'
