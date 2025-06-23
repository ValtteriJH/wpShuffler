#!/bin/bash

# Check the current APP_DEBUG state:
# debug_state=$(grep APP_DEBUG [path_to].env | cut -d = -f2)
debug_state=$(cat .env)

# Echo it to the user:
# printf "The Current DEBUG setting is: %s \\n" "$debug_state"
printf "The Current .env path and  is: %s \\n" "$debug_state"

# Ask if the setting needs to be changed:
read  -r -p "Do you need to change the source dir (answer/n) " sourceDirAnswer "$(echo \n)"

# If the state needs to be changed - change it - else exit:
if [ "$debug_answer" != "y" ]; then
    printf "Leaving .env as: %s \\n" "$debug_state"
fi

# Setting needs to be changed:
# Clear the current APP_DEBUG line:
read  -r -p "Do you need to change the destination dir (answer/n) " destDirAnswer "$(echo \n)"

read  -r -p "Do you need to change the wallpaper name (answer/n) " fileNameAnswer "$(echo \n)"


# Change the DEBUG setting:
if [ "$debug_answer" != "n" ]; then
    echo "SOURCEDIR=" >> "$sourceDirAnswer".env
fi

if [ "$destDirAnswer" != "n" ]; then
    echo "DESTDIRDIR=" >> "$destDirAnswer".env
fi
if [ "$fileNameAnswer" != "n" ]; then
    echo "NAME=" >> "$fileNameAnswer".env
fi

go build -o shuffler
exit

