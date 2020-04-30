#!/usr/bin/env bash

# <bitbar.title>Firefox Profiles</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Vijay Soni</bitbar.author>
# <bitbar.author.github>vs4vijay</bitbar.author.github>
# <bitbar.desc>Open firefox with list of profiles</bitbar.desc>
# <bitbar.dependencies>Bash</bitbar.dependencies>

name="FF"
executable="/Applications/Firefox.app/Contents/MacOS/firefox"
profiles=$(ls ~/Library/Application\ Support/Firefox/Profiles)

image="iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABrElEQVQ4jZ1RsYpTURAdV0VZ7N7MzW4aLYTVVkS0ELS2sBIrsUshJHPuxmLtooWNNoKFYCEopNgfUFa3EhsrG2VBUFSMb+YGsRBUZH0WbxOyyXsqDkxxuefMnHOG6B+q6NFcinx00F3cXwnwKCuDVnN+9E7KS0l5aRLzqb0gCXzfIa/y2Di7bYBBPpqGdUO448juGWTjdfvgnulFw252yCFrprJpMVwtejRHxTnaaZBfDilGbTG8HCI7bBoaM3ZatNs0rJvKz7TMp8kQLkySJzuPcqvG8kWHFIZwjVKHH1eRU+RuQbSjakAC3yhx/JQc/GKabAh9QzhRc5Fd3pHbDilM5QsZwruZ7eAjlecqt58xyAeHFB75DaXIT2YURPlsGm56lFVXTh5lZexf5fwYq/yQPIrWheiQoUPab3sH9hIRDWN2rDz1WClo0G2yK3+dIUdZTeDFieRP5irvTcOPrQC/55cbofyEXKlSsAV+XhW0Q65vTxbZoz9YmVKXPRvZGteg1Zw3hP7fyCnyA78k++quRAl8yhD6pV/ZdOVvBtnwjtzNlxvHa4n/W78BOnRpPACO0JkAAAAASUVORK5CYII="

function main() {
	args="$1"

	if [ "${args}" = "" ]; then
		show_menu
	elif [ "${args}" = "open_profile" ]; then 
		profile="$2"
		echo "Opening Filefox with Profile: ${profile}"
		open_profile "${profile}"
	elif [ "${args}" = "open_profile_manager" ]; then 
		echo "Opening Profile Manager"
		open_profile_manager
	fi

	echo "BitBar Plugin ${name} ran at $(date)" >> "/tmp/bitbar.log"
}

function show_menu() {
	echo "${name} | image=${image}"
	echo "---"

	for profile in ${profiles}; do
		profile_name="${profile##*.}"

		echo "${profile_name} | bash=${executable} param1=-no-remote param2=-P param3=${profile_name} terminal=false"
		echo "---"
	done

	echo "Manage"
	echo "-- Open ProfileManager | bash=${executable} param1=-ProfileManager terminal=false"
}

function open_profile() {
	profile="$1"
	"${executable}" -no-remote -P "${profile}"
}

function open_profile_manager() {
	"${executable}" -ProfileManager
}

main "$@"