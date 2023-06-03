#!/bin/bash

# Function to add a line, commit, and echo a message
addline_commit_echo_a_message() {
  local message=$1
  local filepath=$2

  # Add new line to log
  echo -e "$message" >> "$filepath"

  # Add file changes
  git add "$filepath"

  # Commit changes with log message
  git commit -m "$message"

  # Print the message
  echo "Message: $message"
}

# Check if there are 2 input numbers
if [[ $# -eq 2 ]]; then
  # Generate random number between the two input numbers
  random_number=$(shuf -i "$1-$2" -n 1)
  times=$random_number
else
  # If there is only one input number, use it as the "times" value
  times=$1
fi

# Loop "times-1" number of times
for ((i=1; i<$times; i++))
do
  # Set the log message as a dot
  log_message="."

  # Call the function to add a line, commit, and echo the message
  addline_commit_echo_a_message "$log_message" "log.txt"
done

# Get the current date
current_date=$(date +%Y-%m-%d)

# Set the last log message with date and total commits
log_message="Last commit on $current_date, total commits: $times"

# Call the function to add a line, commit, and echo the final log message
addline_commit_echo_a_message "$log_message" "log.txt"

# Push the changes
git push
