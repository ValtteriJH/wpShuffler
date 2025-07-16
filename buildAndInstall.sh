#!/bin/bash

# Check the current APP_DEBUG state:
# debug_state=$(grep APP_DEBUG [path_to].env | cut -d = -f2)
# envPath=$(cat ~/.config/wpShuffler/.env)
#
# eval "install -Dv .env ~/.config/wpShuffler/.env"

mkdir -p ~/.config/wpShuffler/ && touch ~/.config/wpShuffler/.env

envPath=$(realpath ~/.config/wpShuffler/.env)
destPath=$(realpath ~/.config/wpShuffler/)
debug_state=$(cat "$envPath")

# Echo it to the user:
# printf "The Current DEBUG setting is: %s \\n" "$debug_state"

printf "The Current .env path and  is: %s \\n" "$debug_state"

# Ask if the setting needs to be changed:
read  -r -p "Do you need to change the source dir (y/n) " changeSettings "$(echo \n)"

# If the state needs to be changed - change it - else exit:
if [ "$changeSettings" != "y" ]; then
    printf "Leaving .env as: %s \\n" "$debug_state"
    go build -o shuffler
    sudo cp shuffler /usr/bin/
    exit
fi

read  -r -p "Enter new source directory path " dirAnswer "$(echo \n)"

sourceDirAnswer=$(eval "realpath $dirAnswer")

echo $sourceDirAnswer

# Change the DEBUG setting:
if [ "$debug_answer" != "n" ]; then
    echo "SOURCEDIR="$sourceDirAnswer"" > $envPath
fi

if [ "$destDirAnswer" != "n" ]; then
    echo "DESTDIR="$destPath"" >> $envPath
fi
if [ "$fileNameAnswer" != "n" ]; then
    echo "NAME=.wallpaper.jpg" >> $envPath
fi

go build -o shuffler
sudo cp shuffler /usr/bin/
exit

