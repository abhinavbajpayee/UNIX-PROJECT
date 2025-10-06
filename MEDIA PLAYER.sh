#!/bin/bash

# Simple Menu-based Media Player Script
# Author: Abhinav Bajpai (for Unix systems)
# Description: Lists and plays audio/video files interactively

# Directory containing media files
MEDIA_DIR="$HOME/Music"   # Change this to your folder (e.g., ~/Videos or /mnt/media)

# Supported media formats
EXTENSIONS="mp3 wav mp4 mkv avi flac ogg"

# Command to play files (set to your preferred player)
PLAYER="vlc"   # or use "mpv" or "ffplay -nodisp -autoexit"

# Function to list files
list_files() {
    echo "Listing media files in: $MEDIA_DIR"
    echo "----------------------------------"
    i=1
    files=()

    # Find files with supported extensions
    for ext in $EXTENSIONS; do
        for file in "$MEDIA_DIR"/*.$ext; do
            if [[ -f "$file" ]]; then
                echo "$i) $(basename "$file")"
                files+=("$file")
                ((i++))
            fi
        done
    done

    # Check if any files found
    if [ ${#files[@]} -eq 0 ]; then
        echo "No media files found!"
        return 1
    fi

    echo "----------------------------------"
    echo -n "Enter your choice (1-${#files[@]}, 0 to exit): "
    read choice

    if [[ "$choice" -eq 0 ]]; then
        echo "Exiting..."
        exit 0
    elif [[ "$choice" -ge 1 && "$choice" -le ${#files[@]} ]]; then
        echo "Playing: ${files[$((choice-1))]}"
        $PLAYER "${files[$((choice-1))]}" &
    else
        echo "Invalid choice!"
    fi
}

# Main loop
while true; do
    clear
    echo "======= MEDIA PLAYER MENU ======="
    echo "1) List & Play Media Files"
    echo "2) Change Directory (Current: $MEDIA_DIR)"
    echo "0) Exit"
    echo "================================="
    echo -n "Enter your choice: "
    read option

    case $option in
        1)
            list_files
            read -p "Press Enter to return to menu..."
            ;;
        2)
            echo -n "Enter new directory path: "
            read new_dir
            if [ -d "$new_dir" ]; then
                MEDIA_DIR="$new_dir"
                echo "Directory changed to $MEDIA_DIR"
            else
                echo "Invalid directory!"
            fi
            sleep 1
            ;;
        0)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option! Try again."
            sleep 1
            ;;
    esac
done
