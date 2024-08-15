#!/bin/bash

# Menu options with icons
options="📂 Open File\n🧮 Run Calculator"

# Path to fzf
FZF_PATH=~/.fzf/bin/fzf

# Function to handle the "Open File" option
open_file() {
		# selected_file=$(fd . -t f --exclude ~/anaconda3 | $FZF_PATH --prompt="📂  Select a file: ")
		selected_file=$(fd . -t f --exclude 'anaconda3' ~ | $FZF_PATH --prompt="📂  Select a file: ")
		if [ -n "$selected_file" ]; then
				# systemd-run --user xdg-open "$selected_file"
				xdg-open "$selected_file"
				exit
		fi
}



# Function to handle the "Run Calculator" option
run_calculator() {
		qalc
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
				*)
						echo "Invalid argument. Use 'file', 'calculator', or 'application'."
						exit 1
						;;
		esac
else
		# Show menu with fzf
		selected_option=$(echo -e "$options" | $FZF_PATH --prompt="Select an option: ")

		# Handle the selected option
		case "$selected_option" in
				"📂 Open File")
						open_file
						;;
				"🧮 Run Calculator")
						run_calculator
						;;
				"🚀 Open Application")
						open_application
						;;
				*)
						echo "Invalid option selected."
						;;
		esac
fi

exit
