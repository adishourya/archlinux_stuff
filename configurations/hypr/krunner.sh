#!/bin/bash

# Menu options with icons
options="📂 Open File\n🧮 Run Calculator\n🚀 Open Application"

# Path to fzf
FZF_PATH=~/.fzf/bin/fzf

# Function to handle the "Open File" option
open_file() {
		selected_file=$(fd . -t f -E d ~ | $FZF_PATH --prompt="📂  Select a file: ")
		if [ -n "$selected_file" ]; then
				systemd-run --user xdg-open "$selected_file"
				exit
		fi
}

# Function to handle the "Run Calculator" option
run_calculator() {
		qalc
		exit
}

# Function to handle the "Open Application" option

# # Function to handle the "Open Application" option
open_application() {
		# selected_app=$(ls /usr/share/applications | awk -F '.desktop' '{ print $1 }' | $FZF_PATH --prompt="🚀 Select an application: ")
		selected_app=$(compgen -c | $FZF_PATH --prompt="🚀 Select an application: ")
		if [ -n "$selected_app" ]; then
				systemd-run --user "$selected_app"
				exit
		fi
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
				"application")
						open_application
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
