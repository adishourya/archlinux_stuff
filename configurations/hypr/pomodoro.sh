#!/bin/bash

# Function to clear the screen and print the timer in the center
print_timer() {
	# Get terminal size
	rows=$(tput lines)
	cols=$(tput cols)

	# Calculate the position to print the timer in the center
	tput clear
	tput cup $((rows / 2)) $(( (cols - 5) / 2))
	printf "%02d:%02d" $1 $2
}

# Check if an argument is provided, prompt the user if not
if [ -z "$1" ]; then
	read -p "Mins: " input_minutes

	if [ -z "$input_minutes" ]; then
		total_seconds=$(( 45 * 60 ))
	else
		total_seconds=$(( input_minutes * 60 ))
	fi
else
	total_seconds=$(( $1 * 60 ))
fi

# Trap CTRL+C to clear the screen before exiting
trap 'tput clear; tput cnorm; exit 0' INT

# Hide the cursor
tput civis

while [ $total_seconds -gt 0 ]; do
	# Calculate minutes and seconds
	minutes=$(( total_seconds / 60 ))
	seconds=$(( total_seconds % 60 ))

	# Print the timer
	print_timer $minutes $seconds

	# Wait for one second
	sleep 1

	# Decrement the total seconds
	total_seconds=$(( total_seconds - 1 ))
done

# Final display when time's up
print_timer 0 0
tput cup $((rows / 2 + 1)) $(( (cols - 9) / 2))
# Restore the cursor
tput cnorm
