#!/usr/bin/env bash

# <bitbar.title>Batman</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Vijay Soni</bitbar.author>
# <bitbar.author.github>vs4vijay</bitbar.author.github>
# <bitbar.desc>Show Batman Logo</bitbar.desc>
# <bitbar.dependencies>Bash</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/vs4vijay/bitbar-plugins</bitbar.abouturl>

name="Batman"
logos=(
	"https://cdn4.iconfinder.com/data/icons/superheroes/512/batman-16.png"
	"https://cdn3.iconfinder.com/data/icons/batman/154/batman-skin-mask-16.png"
	"https://cdn3.iconfinder.com/data/icons/batman/154/batman-skin-mask-16.png"
	"https://cdn4.iconfinder.com/data/icons/one-lineecons/72/batman-logo-16.png"
	"https://cdn1.iconfinder.com/data/icons/geometry-1/512/batman-bat-comics-16.png"
	"https://cdn0.iconfinder.com/data/icons/geometry-1/512/bat-batman-vampire-16.png"
	"https://cdn1.iconfinder.com/data/icons/geometry-1/512/bat-batman-mask-face-16.png"
	"https://cdn1.iconfinder.com/data/icons/mobile-device/512/batman-bat-blue-round-16.png"
	"https://cdn3.iconfinder.com/data/icons/airport-navigation-2/154/batman-supehero-comics-16.png"
	"https://cdn2.iconfinder.com/data/icons/halloween-flat-19/32/halloween_bat_batman_vampire-16.png"
	"https://cdn2.iconfinder.com/data/icons/halloween-icon-t-event-flat-1/64/Halloween-Flat-Bat-16.png"
	"https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-16.png"
	"https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-22-16.png"
)

PATH="/usr/local/bin/:${PATH}"

function main() {
	args="$1"

	show_menu

	echo "BitBar Plugin ${name} ran at $(date)" >> "/tmp/bitbar.log"
}

function show_menu() {

	for logo in "${logos[@]}"; do
		echo "${name} | image=$(curl -s ${logo} | base64)"
	done

	echo "---"
	echo "Refresh | refresh=true"
}

main "$@"