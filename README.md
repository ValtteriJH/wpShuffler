# Wallpaper shuffler

Small utility to hotswap wallpapers with a seleced file folder and hsetroot

Confs in ~/.config/wpShuffler/

After install binary in /bin/shuffler

Compile with GO. Deps:
GO binaries
github.com/joho/godotenv
hsetroot

drop compiled file into desired destination, and link to i3 bind

for setting parameters: create .env file to the root of the project with following items

SOURCEDIR= /path/ # Replace with your source directory
DESTDIR= /path/ # Replace with your destination directory
LOADDIR=/path/wallpaper.jpg # Replace with your destination directory
NAME=wallpaper.jpg
