#!/bin/bash
# from https://www.linuxjournal.com/content/create-dynamic-wallpaper-bash-script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # Get the script's current directory

#cfg
linksFile="links.txt"
useragent="Love by u/gadelat"
timeout=60

mkdir $DIR/downloads
cd $DIR/downloads

# Download the subreddit's webpages
function download {
subreddit=$1
url="https://www.reddit.com/r/$subreddit/.json?raw_json=1"
content=`wget -T $timeout -U "$useragent" -q -O - $url`

urls=$(echo -n "$content"| jq -r '.data.children[]|select(.data.post_hint|test("image")) | .data.preview.images[0].source.url')
for url in $urls; do
    echo $url >> temp
done
}


# For each line in links file
while read l; do
   if [[ $l != *"#"* ]]; then # if line doesn't contain a hashtag (comment)
        download $l&
   fi
done < ../$linksFile

wait # wait for all forked processes to return

sed -i '/www.redditstatic.com/d' temp # remove reddit pics that exist on most pages from the list


wallpaper=$(shuf -n 1 temp) # select randomly from file and DL

echo $wallpaper >> $DIR/log # save image into log in case we want it later

feh --no-fehbg --bg-scale $wallpaper
# wget -b $wallpaper -O $DIR/wallpaperpic 1>/dev/null # Download wallpaper image

# gsettings set org.gnome.desktop.background picture-uri file://$DIR/wallpaperpic # Set wallpaper (Gnome only!)


rm -r $DIR/downloads # cleanup

