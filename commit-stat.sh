#!/bin/bash

# Loop indefinitely
while true
do
  # Check if current time is within specified time range (9-11am and 1-6pm)
  # current_hour=$(date +%H)
  # if [[ ( "$current_hour" -ge 9 && "$current_hour" -lt 11 ) || ( "$current_hour" -ge 13 && "$current_hour" -lt 18 ) ]]; then
    # Add new line to log
    log_message="file updated at [$(date +%Y-%m-%d\ %H:%M:%S)]"
    echo "$log_message" >> log.txt

    # Add file changes
    git add log.txt

    # Commit changes with log message
    git commit -m "$log_message"

    # Push changes
    git push

    # Generate random wait time between 10 and 20 minutes (900-1800 seconds)
    wait_time=$((RANDOM%601+600))

    # Get current time
    NOW=$(date +%H:%M:%S)

    # Print sleep time and current time to console
    echo "NOW: $NOW SLEEP: $((wait_time/60)) MINUTES AND $((wait_time%60)) SECONDS"

    # Wait for random interval
    sleep $wait_time
  # else
  #   # If current time is not within time range, wait for 1 minute before checking again
  #   sleep 60
  # fi
done
