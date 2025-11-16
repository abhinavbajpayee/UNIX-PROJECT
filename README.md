1. Make sure you are inside your Codio workspace.  
2. Create the Script File using:  
   `nano media_player.sh`  

   **Write the following code inside it:**  
   ```bash
   #!/bin/bash
   MEDIA_DIR="./media"

   if [ ! -d "$MEDIA_DIR" ]; then
       echo "Media directory not found! Creating one..."
       mkdir -p "$MEDIA_DIR"
       echo "Please add your songs or videos (.mp3, .mp4) into the 'media' folder."
       exit 1
   fi

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
   ```
   *(Press Ctrl + O → Enter to save, Ctrl + X to exit)*  

3. Make the Script Executable:  
   `chmod +x media_player.sh`  

4. Add Media Files (you can upload real `.mp3` or `.mp4` files, or create dummy ones):  
   ```bash
   cd media
   touch song1.mp3 song2.mp4 song3.mp3
   cd ..
   ```

5. Run the Media Player Script:  
   `./media_player.sh`
