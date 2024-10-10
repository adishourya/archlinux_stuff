#!/bin/bash

# Menu options with icons
options="📂 Open File\n🧮 Run Calculator\n😀 Emoji Picker"

# Path to fzf
FZF_PATH=~/.fzf/bin/fzf

# Function to handle the "Open File" option
open_file() {
		selected_file=$(fd . -t f --exclude 'anaconda3' ~ | $FZF_PATH --prompt="📂  Select a file: ")
		if [ -n "$selected_file" ]; then
				nohup xdg-open "$selected_file" && exit	
		fi
}

# Function to handle the "Run Calculator" option
run_calculator() {
		qalc
		exit
}

# Function to handle the "Emoji Picker" option
emoji_picker() {
		emoji=$(cat ~/.config/hypr/emojis.txt | $FZF_PATH | awk '{print $1}' | tr -d '\n')
		if [ -n "$emoji" ]; then
				echo -n "$emoji" | wl-copy
				notify-send "$emoji copied to the clipboard"
				# 😀
		fi
		exit
}

# Check for command-line argument
if [ $# -gt 0 ]; then
		case "$1" in
				"file")
						open_file
						;;
				"calculator")
						run_calculator
						;;
				"emoji-picker")
						emoji_picker
						;;
				*)
						echo "Invalid argument. Use 'file', 'calculator', or 'emoji-picker'."
						exit 1
						;;
		esac
else
		# Show menu with fzf
		selected_option=$(echo -e "$options" | $FZF_PATH --border)

		# Handle the selected option
		case "$selected_option" in
				"📂 Open File")
						open_file
						;;
				"🧮 Run Calculator")
						run_calculator
						;;
				"😀 Emoji Picker")
						emoji_picker
						;;
				*)
						echo "Invalid option selected."
						;;
		esac
fi
exit
