1.Type nano media_player.sh
2.paste it inside the Nano editor.
{ #!/bin/bash
# ------------------------------------------
# Media Player Menu (Codio Version)
# ------------------------------------------
# This version simulates playing music/video files since
# Codio doesn't support actual media playback.

MEDIA_DIR="./media"

# Check if media directory exists
if [ ! -d "$MEDIA_DIR" ]; then
    echo "Media directory not found! Creating one..."
    mkdir -p "$MEDIA_DIR"
    echo "Please add your songs or videos (.mp3, .mp4) into the 'media' folder."
    exit 1
fi

# Main menu function
while true; do
    echo "-----------------------------------------"
    echo "          🎶 MEDIA PLAYER MENU 🎥         "
    echo "-----------------------------------------"
    echo "1) List available media files"
    echo "2) Play a media file (Simulated)"
    echo "3) Exit"
    echo "-----------------------------------------"
    read -p "Enter your choice [1-3]: " choice

    case $choice in
        1)
            echo ""
            echo "Available media files:"
            echo "-----------------------------------------"
            ls "$MEDIA_DIR" | grep -E "\.mp3$|\.mp4$" || echo "No media files found!"
            echo "-----------------------------------------"
            ;;
        2)
            echo ""
            echo "Choose a file to play:"
            files=($(ls "$MEDIA_DIR" | grep -E "\.mp3$|\.mp4$"))
            
            if [ ${#files[@]} -eq 0 ]; then
                echo "No media files found to play!"
                continue
            fi

            for i in "${!files[@]}"; do
                echo "$((i+1))) ${files[$i]}"
            done

            read -p "Enter number of the file to play: " num

            if [[ $num -gt 0 && $num -le ${#files[@]} ]]; then
                file="${files[$((num-1))]}"
                echo ""
                echo "Now playing: $file 🎧"
                echo "-----------------------------------------"
                for i in {1..5}; do
                    echo -ne "Playing... [${i}/5] seconds\r"
                    sleep 1
                done
                echo ""
                echo "Finished playing: $file ✅"
            else
                echo "Invalid selection!"
            fi
            ;;
        3)
            echo "Exiting Media Player. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please enter 1, 2, or 3."
            ;;
    esac
done
}
3.Press Ctrl + O → then press Enter to save the file\
4.Press Ctrl + X to exit Nano
5.Run this command: chmod +x media_player.sh
6.mkdir media
7.cd media
touch song1.mp3 song2.mp4 song3.mp3
cd ..
8.Run file by, ./media_player.sh
9. Menu will be displayed press the choice you want to use 
10. use 3 to EXIT.  
