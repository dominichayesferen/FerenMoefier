#!/bin/bash

# These lines are required for translations support... please don't touch them.
export TEXTDOMAINDIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/translations"
export TEXTDOMAIN="Moeification"
. gettext.sh



if [[ "$@" == *"--credits"* ]]; then

    echo "$(eval_gettext "Thanks to these people for making the following resources that made Feren Moefier possible:")

- $(eval_gettext Wallpaper): $(eval_gettext "Moebuntu Default by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Mari by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Rikka Windows by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Rikka and Yuuta Fantasy by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Rikka Train Station by Kyoto Animation (Love, Chunibyo and Other Delusions! Take On Me)")
- $(eval_gettext Wallpaper): $(eval_gettext "CLANNAD by") https://www.deviantart.com/mr123spiky/art/Clannad-Wallpaper-At-The-Foot-Of-The-Hill-518189657
- $(eval_gettext Wallpaper): $(eval_gettext "Madoka Magica MCs by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Best Girl from Meduka by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "anohana by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Windows 7 Waifu by") ? $(eval_gettext "(character definitely by Microsoft Japan)")
- $(eval_gettext Wallpaper): $(eval_gettext "Windows 10 Waifu by") ? $(eval_gettext "(character definitely by Microsoft Japan)")
- $(eval_gettext Wallpaper): $(eval_gettext "Yuuta by") https://greenmapple17.deviantart.com/art/Yuuta-Togashi-Chuunibyo-Minimalist-Wallpaper-524763142
- $(eval_gettext Wallpaper): $(eval_gettext "More Chuuni by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Dango dango dango dango by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "No Escape From Snow Halation by Bandai Visual, Lantis, ASCII Media Works, Bushiroad")
- $(eval_gettext Wallpaper): $(eval_gettext "Minimal K-On by") https://www.deviantart.com/lucifer012/art/K-ON-Minimalist-Anime-Wallpaper-664262777
- $(eval_gettext Wallpaper): $(eval_gettext "Diary of Our Days at the Breakwater by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Diary of Our Days at the Breakwater 2 by") ?
- $(eval_gettext Wallpaper): $(eval_gettext "Your Name Mitsuha by") https://www.deviantart.com/ryuzuy/art/Your-Name-867355784
- $(eval_gettext Wallpaper): $(eval_gettext "Your Name 2 by Shinkai Makoto, CoMix Wave Films")
- $(eval_gettext Wallpaper): ($(eval_gettext "Spoiler")) $(eval_gettext "T** I******** B******* L**** by Kyoto Animation (Love, Chunibyo and Other Delusions! Season 1 Episode 12)")
- $(eval_gettext Wallpaper): ($(eval_gettext "Spoiler")) $(eval_gettext "oh no by") ?
- $(eval_gettext Wallpaper): ($(eval_gettext "Spoiler")) $(eval_gettext "CLANNAD Family by") ?
- $(eval_gettext Wallpaper): ($(eval_gettext "Spoiler")) $(eval_gettext "Never Forget by") ?
- $(eval_gettext "Moedora Logo by Moebuntu")
- $(eval_gettext "Moebuntu Logo by Moebuntu")
- $(eval_gettext "GIMP-tan Splash Screen images by Moebuntu, Shigetch (tabstop Annex B)")
- $(eval_gettext "Moebuntu GTK theme by Moebuntu")
- $(eval_gettext "Moebuntu icon set by Moebuntu")
- $(eval_gettext "Moebuntu GNOME Shell theme by Moebuntu")
- $(eval_gettext "Smol Nozomi by") https://triple-q.tumblr.com/post/131855281252/very-smol-nozoomu
- $(eval_gettext "Moebuntu Login Screen Background by Moebuntu")
- $(eval_gettext "Moe Plasma Colour Scheme by Dominic Hayes")
- $(eval_gettext "Moe Plasma Global Theme by Dominic Hayes")
- $(eval_gettext "Moe GNOME/Cinnamon Wallpaper List by Dominic Hayes")
- $(eval_gettext "Moefier PostInst by Dominic Hayes")"
    exit 0

fi


if [ "$(whoami)" != "root" ]; then
    echo "$(eval_gettext "You need to run this as root:") sudo !!"
    exit 1
fi

RED=`tput setaf 1`
NC=`tput sgr0`
FULLPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [[ "$@" != *"--auto"* ]]; then
    echo "$(eval_gettext "Welcome to the Feren Moefier. Before we begin, let's get some disclaimers out of the way:")

${RED}$(eval_gettext "1. THIS IS A PERMANENT CHANGE")${NC}$(eval_gettext " - any patches this does to the system will be permanent until either you reinstall or updates override the files")
$(eval_gettext "2. Credits to the people who made the wallpapers provided, and credits to the maker of Moebuntu for the theme and icon set.")
$(eval_gettext "3. Once done, the system will immediately reboot.")

$(eval_gettext "Run this command with the '--credits' argument to get credits, or read the README.md instead for credits.")

"
    read -p "$(eval_gettext "Knowing this, are you SURE you want to continue?") [y/N] " yn

    case $yn in
        [Yy]* ) clear; echo "$(eval_gettext "Then let us begin.")";;
        * ) exit 1;;
    esac
else
    echo "$(eval_gettext "Automatic Mode is enabled. Let's get this started.")"
fi
    
set +m
stty intr ''

if [[ "$@" != *"--spoilers"* ]] && [[ "$@" != *"--no-spoilers"* ]]; then

read -p "
$(eval_gettext "Would you like to enable additional spoiler wallpapers?") ${RED}$(eval_gettext "These wallpapers spoil major events in the following animes:")${NC}

$(eval_gettext "Chuunibyo Demo Koi Ka Shitai (aka Love, Chunibyo and Other Delusions!)")
$(eval_gettext "CLANNAD (After Story)")
$(eval_gettext "anohana.")


$(eval_gettext "Enable spoiler wallpapers?") [y/N] " yn2

case $yn2 in
    [Yy]* ) MAJORSPOILERS=1;;
    * ) MAJORSPOILERS=0;;
esac

if [ "$MAJORSPOILERS" = 1 ]; then
    read -p "${RED}$(eval_gettext "ARE YOU ABSOLUTELY SURE YOU WANT TO DO THIS?")${NC}

${RED}$(eval_gettext "These extra wallpapers WILL SPOIL MAJOR EVENTS IN THOSE ANIMES.")${NC} $(eval_gettext "Please, if you haven't watched one of these animes, TURN BACK by answering 'N' to this prompt and watch those animes.") ${RED}$(eval_gettext "You'll regret spoiling yourself.")${NC}


$(eval_gettext "Enable spoiler wallpapers?") [y/N] " yn2

    case $yn2 in
        [Yy]* ) MAJORSPOILERS=1;;
        * ) MAJORSPOILERS=0;;
    esac
fi
elif [[ "$@" == *"--spoilers"* ]]; then
    echo "
${RED}$(eval_gettext "Enabling Spoiler Wallpapers due to supplied argument.")${NC}
"
    MAJORSPOILERS=1
elif [[ "$@" == *"--no-spoilers"* ]]; then
    echo "
$(eval_gettext "Spoiler Wallpapers disabled due to supplied argument.")
"
    MAJORSPOILERS=0
fi

echo "$(eval_gettext "Downloading wallpapers...")
"

rm -rf /usr/share/weebpapers
mkdir /usr/share/weebpapers > /dev/null 2>&1


wget http://blog-imgs-36.fc2.com/a/a/n/aanimekabegami/68e9328c.jpg -O "/usr/share/weebpapers/(Moe) Moebuntu Default.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Moebuntu Default wallpaper!") $(eval_gettext "$(eval_gettext "Aborting now.")")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Moebuntu 'Default' wallpaper.")"
fi
wget https://i.ytimg.com/vi/PsARNhjWdHc/maxresdefault.jpg -O "/usr/share/weebpapers/(Moe) Mari.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Mari wallpaper! It's Not Joke.") $(eval_gettext "$(eval_gettext "Aborting now.")")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Mari wallpaper.")"
fi
wget https://i.redd.it/0k81wur3x8a21.png -O "/usr/share/weebpapers/(Moe) Rikka Windows.png" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Rikka uncovering Windows wallpaper!") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Rikka uncovering Windows wallpaper.")"
fi
wget https://oboitut.com/uploads/posts/oboitut.com_10989.jpg -O "/usr/share/weebpapers/(Moe) Rikka and Yuuta Fantasy.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Rikka and Yuuta Fantasy wallpaper! Guess it was just a fantasy after all...") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Rikka and Yuuta Fantasy wallpaper.")"
fi
wget https://i.imgur.com/WdqYXph.jpg -O "/usr/share/weebpapers/(Moe) Rikka Train Station.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Rikka at Train Station wallpaper!") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Rikka at Train Station wallpaper. TAKE ME ONNNNNNNNNN!")"
fi
wget https://cdn.discordapp.com/attachments/741701321874472990/787449057488011294/clannad_wallpaper_at_the_foot_of_the_hill_by_mr123spiky_d8kilp5.jpg -O "/usr/share/weebpapers/(Moe) CLANNAD.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the CLANNAD wallpaper!") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the CLANNAD wallpaper.")"
fi
wget http://images4.fanpop.com/image/photos/19300000/Hi-Kyubey-mahou-shoujo-madoka-magica-19305621-1500-1033.jpg -O "/usr/share/weebpapers/(Moe) Madoka Magica MCs.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Madoka Magica MCs wallpaper! That darn entropy, probably.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Madoka Magica Main Characters wallpaper.")"
fi
wget https://images4.alphacoders.com/296/thumb-1920-296026.jpg -O "/usr/share/weebpapers/(Moe) Best Girl from Meduka.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Best Madoka Magica Girl wallpaper! Being meguka is suffering.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Best Madoka Magica Girl wallpaper.")"
fi
wget https://i2.hdslb.com/bfs/archive/18c16a4675b6106fc4001074040f31c5d872b915.jpg -O "/usr/share/weebpapers/(Moe) anohana.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Anohana wallpaper! Respect her privacy, I guess.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Anohana wallpaper.")"
fi
wget https://i.imgur.com/6gtDb9r.jpg -O "/usr/share/weebpapers/(Moe) Windows 7 Waifu.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Windows 7 Waifu wallpaper! Leave her be now she graduated, SMH.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Windows 7 Waifu wallpaper.")"
fi
wget https://i.redd.it/l16umf7245901.jpg -O "/usr/share/weebpapers/(Moe) Windows 10 Waifu.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Windows 10 Waifu wallpaper! Probably too bloated to carry.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Windows 10 Waifu wallpaper.")"
fi
wget https://cdn.discordapp.com/attachments/161953839853993984/780224215654989824/24.jpg -O "/usr/share/weebpapers/(Moe) Yuuta.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Yuuta wallpaper! Don't call him Dark Flame Master now, will ya?") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Yuuta wallpaper.")"
fi
wget https://cdn.discordapp.com/attachments/161953839853993984/776821283240280104/21.jpg -O "/usr/share/weebpapers/(Moe) More Chuuni.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading another Chunibyo wallpaper! What delusional circumstances, eh.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded another Chunibyo wallpaper.")"
fi
wget https://i.pinimg.com/originals/12/02/9f/12029fd2ff5bf26c6005c2c1573bdf6f.jpg -O "/usr/share/weebpapers/(Moe) Dango dango dango dango.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "My apologies, I was crying too much to successfully download the Dango wallpaper.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Dango dango dango dango wallpaper.")"
fi
wget https://i.pinimg.com/originals/bd/8d/bf/bd8dbf8fdfc559870b80a4d968b724b8.jpg -O "/usr/share/weebpapers/(Moe) No Escape From Snow Halation.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Snow Halation wallpaper! You've escaped for now.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Snow Halation wallpaper.")"
fi
wget https://cdn.discordapp.com/attachments/473183956137934858/782758685368909864/dazhgft-c6a57dc7-9971-4bbb-aea7-b7336e71ce23.png -O "/usr/share/weebpapers/(Moe) Minimal K-On.png" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the K-On! wallpaper!") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the K-On! wallpaper.")"
fi
wget https://cdn.tatenoe.com/diary-of-our-days-at-the-breakwater/diary-of-our-days-at-the-breakwater-3-1280x720.jpg -O "/usr/share/weebpapers/(Moe) Diary of Our Days at the Breakwater.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading a Diary of Our Days at the Breakwater wallpaper! I guess the installer got stuck at this part. That sucks.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded a Diary of Our Days at the Breakwater wallpaper.")"
fi
wget https://i.imgur.com/Ckgx70Q.jpg -O "/usr/share/weebpapers/(Moe) Diary of Our Days at the Breakwater 2.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading another Diary of Our Days at the Breakwater wallpaper!") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded another Diary of Our Days at the Breakwater wallpaper.")"
fi
wget https://images7.alphacoders.com/737/737487.png -O "/usr/share/weebpapers/(Moe) Your Name Mitsuha.png" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Your Name Mitsuha wallpaper! Something must have happened...") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Your Name Mitsuha wallpaper.")"
fi
wget http://www.kiminona.com/images/top/main_vsl02.jpg -O "/usr/share/weebpapers/(Moe) Your Name 2.png" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Your Name 2 wallpaper! Swapping bodies in 3, 2, 1...") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Your Name 2 wallpaper.")"
fi
    
if [ "$MAJORSPOILERS" = 1 ]; then
echo "${RED}$(eval_gettext "Downloading Major Spoiler wallpapers... The snow is falling.")${NC}
"

wget https://livedoor.blogimg.jp/poterobo/imgs/e/4/e4cd77b1.jpg -O "/usr/share/weebpapers/(Moe) The Invisible Boundary Lines.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Sorry, I was too busy trying not to cry that I didn't successfully download the Invisible Boundary Lines wallpaper.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Invisible Boundary Lines wallpaper.")"
fi
wget https://i.ytimg.com/vi/hlnrN7gdF1w/maxresdefault.jpg -O "/usr/share/weebpapers/(Moe) oh no.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading a CLANNAD After Story wallpaper!") ${RED}$(eval_gettext "Yet, the snow falls.")${NC} $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded a CLANNAD After Story wallpaper.")"
fi
wget https://hdwallpaperim.com/wp-content/uploads/2017/08/22/81240-Clannad.jpg -O "/usr/share/weebpapers/(Moe) CLANNAD Family.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading another CLANNAD After Story wallpaper!") ${RED}$(eval_gettext "Something's gonna happen to that happy family, won't it?")${NC} $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded another CLANNAD After Story wallpaper.")"
fi
wget https://pbs.twimg.com/media/C7HfgHDW4AI3ulY.jpg -O "/usr/share/weebpapers/(Moe) Never Forget.jpg" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading another anohana wallpaper!") ${RED}$(eval_gettext "Don't forget about her.")${NC} $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded another anohana wallpaper.")"
fi

fi

rm -rf /tmp/moecontents > /dev/null 2>&1
mkdir /tmp/moecontents > /dev/null 2>&1

LOGOTYPE="none"
if [ -f /usr/share/plymouth/themes/spinner/watermark.png ]; then
    echo "
$(eval_gettext "Downloading logo...")
"
    if grep -q 'ubuntu.com' /etc/apt/sources.list > /dev/null 2>&1; then
        LOGOTYPE="ubuntu"
    #TODO: Add Fedora-specific check
    elif grep -q 'NAME=Fedora' /etc/os-release > /dev/null 2>&1; then
        LOGOTYPE="fedora"
        wget http://moebuntu.web.fc2.com/img/special/moedora_logos.png -O /tmp/moecontents/moedora-logo.png > /dev/null 2>&1
        if [ ! $? -eq 0 ]; then
            echo "$(eval_gettext "Oops, an error occured downloading the Moedora logo.") $(eval_gettext "Aborting now.")"
            exit 1
        fi
    fi
    
    echo "$(eval_gettext "Downloaded logo.")"
fi

if [ -f /usr/bin/gimp ] && [ -f /usr/share/gimp/2.0/images/gimp-splash.png ]; then
    echo "
$(eval_gettext "Downloading and installing GIMP-tan Splash Screen...")
"
    if [[ "$(gimp --version)" == *"2.10"* ]]; then
        wget http://moebuntu.web.fc2.com/img/special/gimp-tan210.png -O /tmp/moecontents/gimp-tan.png > /dev/null 2>&1
        cp -f /tmp/moecontents/gimp-tan.png /usr/share/gimp/2.0/images/gimp-splash.png > /dev/null 2>&1
    elif [[ "$(gimp --version)" == *"2.8"* ]]; then
        wget http://moebuntu.web.fc2.com/img/special/gimp-tan28.png -O /tmp/moecontents/gimp-tan.png > /dev/null 2>&1
        cp -f /tmp/moecontents/gimp-tan.png /usr/share/gimp/2.0/images/gimp-splash.png > /dev/null 2>&1
    elif [[ "$(gimp --version)" == *"2.6"* ]]; then
        wget http://moebuntu.web.fc2.com/img/special/gimp-tan26.png -O /tmp/moecontents/gimp-tan.png > /dev/null 2>&1
        cp -f /tmp/moecontents/gimp-tan.png /usr/share/gimp/2.0/images/gimp-splash.png > /dev/null 2>&1
    elif [[ "$(gimp --version)" == *"2.4"* ]]; then
        wget http://moebuntu.web.fc2.com/img/special/gimp-tan24.png -O /tmp/moecontents/gimp-tan.png > /dev/null 2>&1
        cp -f /tmp/moecontents/gimp-tan.png /usr/share/gimp/2.0/images/gimp-splash.png > /dev/null 2>&1
    else
        true
    fi
    
    if [ ! $? -eq 0 ]; then
        echo "$(eval_gettext "Oops, an error occured downloading and installing the GIMP-tan splash.") $(eval_gettext "Aborting now.")"
        exit 1
    else
        echo "$(eval_gettext "Downloaded and installed the GIMP-tan splash screen.")"
    fi
fi


echo "
$(eval_gettext "Downloading themes...")
"
    
echo "$(eval_gettext "Downloading the Moebuntu theme...")"
wget "https://drive.google.com/u/0/uc?id=197CsLK0ZyAK-nuQAUyb71XcKkGeQyRAD&export=download" -O /tmp/moecontents/theme.tar.xz > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Moebuntu theme.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Moebuntu theme.")"
fi

echo "$(eval_gettext "Downloading the Moebuntu icons...")"
wget "https://drive.google.com/u/0/uc?id=1UNCrThP8bDuhsNDOmXvNA23uRgpBlr3F&export=download" -O /tmp/moecontents/icons.tar.xz > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Moebuntu icons.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Moebuntu icons.")"
fi

echo "$(eval_gettext "Downloading the Moebuntu GNOME Shell theme (for compatible GNOME versions, and also resource extraction)...")"
wget "https://drive.google.com/u/0/uc?id=1dXrQ-abdAKMP_3O187rFdtRLsy_YJ8pG&export=download" -O /tmp/moecontents/gshell.tar.xz > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Moebuntu GNOME Shell theme.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Moebuntu GNOME Shell theme.")"
fi

echo "$(eval_gettext "Downloading Smol Nozomi avatar...")"
wget https://i.imgur.com/ZiX8wfF.png -O /tmp/moecontents/.face > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured downloading the Smol Nomozi avatar.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Downloaded the Smol Nozomi avatar.")"
fi


echo "
$(eval_gettext "Moefying the Operating System...")
"

cd /tmp/moecontents
    
echo "$(eval_gettext "Extracting the Moebuntu theme...")"
tar xf /tmp/moecontents/theme.tar.xz > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured extracting the Moebuntu theme.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Extracted the Moebuntu theme.")"
fi

echo "$(eval_gettext "Extracting the Moebuntu icons...")"
tar xf /tmp/moecontents/icons.tar.xz > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured extracting the Moebuntu icons.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Extracted the Moebuntu icons.")"
fi

echo "$(eval_gettext "Extracting the Moebuntu GNOME Shell theme...")"
tar xf /tmp/moecontents/gshell.tar.xz > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured extracting the Moebuntu GNOME Shell theme.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Extracted the Moebuntu GNOME Shell theme.")"
fi

echo "$(eval_gettext "Installing the Moebuntu theme...")"
rm -rf /usr/share/themes/Moe-Pink15S > /dev/null 2>&1
cp -R /tmp/moecontents/Moe-Pink15S /usr/share/themes/Moe-Pink15S > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured installing the Moebuntu theme.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Installed the Moebuntu theme.")"
fi

echo "$(eval_gettext "Installing the Moebuntu icons...")"
rm -rf /usr/share/icons/MoePinkIcons > /dev/null 2>&1
cp -R /tmp/moecontents/MoePinkIcons /usr/share/icons/MoePinkIcons > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured installing the Moebuntu icons.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Installed the Moebuntu icons.")"
fi

echo "$(eval_gettext "Installing the Moebuntu GNOME Shell theme...")"
rm -rf /usr/share/themes/MoePinkShell3 > /dev/null 2>&1
cp -R /tmp/moecontents/MoePinkShell3 /usr/share/themes/MoePinkShell3 > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured installing the Moebuntu GNOME Shell theme.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Installed the Moebuntu GNOME Shell theme.")"
fi

if [ -f /usr/share/gnome-shell/theme/ubuntu.css ]; then
echo "$(eval_gettext "Patching Ubuntu GNOME Shell theme...")"
cp -f /usr/share/themes/MoePinkShell3/gnome-shell/gnome-shell.css /usr/share/gnome-shell/theme/ubuntu.css > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured patching the Ubuntu GNOME Shell theme.") $(eval_gettext "Aborting now.")"
    exit 1
fi

mkdir /usr/share/gnome-shell/theme/assets > /dev/null 2>&1
for file in /usr/share/themes/MoePinkShell3/gnome-shell/assets/*; do
    cp -f "$file" /usr/share/gnome-shell/theme/assets/ > /dev/null 2>&1
done
    
chmod 755 -R /usr/share/gnome-shell/theme/assets/ /usr/share/gnome-shell/theme/ubuntu.css /usr/share/themes/MoePinkShell3 /usr/share/icons/MoePinkIcons /usr/share/themes/Moe-Pink15S > /dev/null 2>&1
echo "$(eval_gettext "Patched the Ubuntu GNOME Shell theme.")"
fi
    
echo "$(eval_gettext "Applying Smol Nozomi avatar on all the users...")"
cd /home
for folder in *; do if id "$folder" &>/dev/null; then
    touch "/home/$folder/.face" > /dev/null 2>&1
    touch "/home/$folder/.face.icon" > /dev/null 2>&1
    cat /tmp/moecontents/.face > "/home/$folder/.face"
    cat /tmp/moecontents/.face > "/home/$folder/.face.icon"
fi; done
cd /tmp/moecontents
    
echo "$(eval_gettext "Installing Smol Nozomi avatar...")"
oldIFS=$IFS
IFS=$'\n'       # make newlines the only separator
if [ -d /usr/share/pixmaps/faces ]; then
    cat /tmp/moecontents/.face > "/usr/share/pixmaps/faces/Smol Nozomi.png"
fi
if [ -d /usr/share/cinnamon/faces ]; then
    cat /tmp/moecontents/.face > "/usr/share/cinnamon/faces/Smol Nozomi.png"
fi
if [ -d /usr/share/user-manager/avatars ]; then
    mkdir /usr/share/user-manager/avatars/Moe > /dev/null 2>&1
    cat /tmp/moecontents/.face > "/usr/share/user-manager/avatars/Moe/Smol Nozomi.png"
fi
if [ -d /usr/share/plasma/avatars ]; then
    cat /tmp/moecontents/.face > "/usr/share/plasma/avatars/Smol Nozomi.png"
fi
IFS=$oldIFS


if [ -f /usr/share/plymouth/ubuntu-logo.png ]; then
echo "$(eval_gettext "Patching Ubuntu's Plymouth logo...")"
cp -f /usr/share/themes/MoePinkShell3/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured patching Ubuntu's Plymouth logo.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Patched Ubuntu's Plymouth logo.")"
fi
fi

if [ -f /usr/share/plymouth/themes/spinner/watermark.png ] && [ "$LOGOTYPE" != "none" ]; then
echo "$(eval_gettext "Patching Plymouth's OS logo...")"
if [ "$LOGOTYPE" = "ubuntu" ]; then
    cp -f /usr/share/themes/MoePinkShell3/ubuntu-logo.png /usr/share/plymouth/themes/spinner/watermark.png > /dev/null 2>&1
elif [ "$LOGOTYPE" = "fedora" ]; then
    cp -f /tmp/moecontents/moedora-logo.png /usr/share/plymouth/themes/spinner/watermark.png > /dev/null 2>&1
else
    true
fi
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured patching Plymouth's OS logo.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Patched Plymouth's OS logo.")"
fi
fi
    
echo "$(eval_gettext "Linking login screen background from GNOME Shell theme into wallpapers directory...")"
ln -sf /usr/share/themes/MoePinkShell3/gnome-shell/assets/moebuntu_bg.png "/usr/share/weebpapers/(Moe) Login Screen.png" > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "$(eval_gettext "Oops, an error occured linking the login screen background into wallpaper directory.") $(eval_gettext "Aborting now.")"
    exit 1
else
    echo "$(eval_gettext "Linked the login screen background into wallpaper directory.")"
fi

if [ -f "/usr/sbin/slick-greeter" ]; then
echo "
$(eval_gettext "Configuring login screen") ($(eval_gettext "Slick Greeter"))...
"

if ! grep -q '[Greeter]' /etc/lightdm/slick-greeter.conf; then
    echo '[Greeter]' > /etc/lightdm/slick-greeter.conf
fi
if ! grep -q 'theme-name=' /etc/lightdm/slick-greeter.conf; then
    echo 'theme-name=Moe-Pink15S' >> /etc/lightdm/slick-greeter.conf
else
    sed -i 's/# theme-name/theme-name/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
    sed -i 's/#theme-name/theme-name/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
    sed -i 's/theme-name=.*/theme-name=Moe-Pink15S/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
fi
if ! grep -q 'icon-theme-name=' /etc/lightdm/slick-greeter.conf; then
    echo 'icon-theme-name=MoePinkIcons' >> /etc/lightdm/slick-greeter.conf
else
    sed -i 's/# icon-theme-name/icon-theme-name/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
    sed -i 's/#icon-theme-name/icon-theme-name/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
    sed -i 's/icon-theme-name=.*/icon-theme-name=MoePinkIcons/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
fi
if ! grep -q 'background=' /etc/lightdm/slick-greeter.conf; then
    echo 'background=/usr/share/weebpapers/(Moe) Login Screen.png' >> /etc/lightdm/slick-greeter.conf
else
    sed -i 's/# background/background/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
    sed -i 's/#background/background/g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
    sed -i 's%background=.*%background=/usr/share/weebpapers/(Moe) Login Screen.png%g' /etc/lightdm/slick-greeter.conf > /dev/null 2>&1
fi
echo "$(eval_gettext "Configured login screen") ($(eval_gettext "Slick Greeter"))."

fi
if [ -f "/usr/sbin/lightdm-gtk-greeter" ]; then
echo "
$(eval_gettext "Configuring login screen") ($(eval_gettext "GTK Greeter"))...
"

if ! grep -q '[greeter]' /etc/lightdm/lightdm-gtk-greeter.conf; then
    echo '[greeter]' > /etc/lightdm/lightdm-gtk-greeter.conf
fi
if ! grep -q 'theme-name =' /etc/lightdm/lightdm-gtk-greeter.conf; then
    echo 'theme-name = Moe-Pink15S' >> /etc/lightdm/lightdm-gtk-greeter.conf
else
    sed -i 's/# theme-name/theme-name/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's/#theme-name/theme-name/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's/theme-name = .*/theme-name = Moe-Pink15S/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's/theme-name=.*/theme-name = Moe-Pink15S/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
fi
if ! grep -q 'icon-theme-name =' /etc/lightdm/lightdm-gtk-greeter.conf; then
    echo 'icon-theme-name = MoePinkIcons' >> /etc/lightdm/lightdm-gtk-greeter.conf
else
    sed -i 's/# icon-theme-name/icon-theme-name/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's/#icon-theme-name/icon-theme-name/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's/icon-theme-name = .*/icon-theme-name = MoePinkIcons/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's/icon-theme-name=.*/icon-theme-name = MoePinkIcons/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
fi
if ! grep -q 'background = ' /etc/lightdm/lightdm-gtk-greeter.conf; then
    echo 'background = /usr/share/weebpapers/(Moe) Login Screen.png' >> /etc/lightdm/lightdm-gtk-greeter.conf
else
    sed -i 's/# background/background/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's/#background/background/g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's%background = .*%background = /usr/share/weebpapers/(Moe) Login Screen.png%g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
    sed -i 's%background=.*%background = /usr/share/weebpapers/(Moe) Login Screen.png%g' /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null 2>&1
fi
echo "$(eval_gettext "Configured login screen") ($(eval_gettext "GTK Greeter"))."

fi
if [ -f "/usr/sbin/unity-greeter" ]; then
echo "
$(eval_gettext "Configuring login screen") ($(eval_gettext "Unity Greeter"))...
"

xhost +SI:localuser:lightdm
sudo -H -u lightdm gsettings set com.canonical.unity-greeter background "/usr/share/weebpapers/(Moe) Login Screen.png"
sudo -H -u lightdm gsettings set com.canonical.unity-greeter theme-name "Moe-Pink15S"
sudo -H -u lightdm gsettings set com.canonical.unity-greeter icon-theme-name "MoePinkIcons"

echo "$(eval_gettext "Configured login screen") ($(eval_gettext "Unity Greeter"))."

fi
if [ -f "/usr/sbin/arctica-greeter" ]; then
echo "
$(eval_gettext "Configuring login screen") ($(eval_gettext "Arctica Greeter"))...
"

xhost +SI:localuser:lightdm
sudo -H -u lightdm gsettings set org.ArcticaProject.arctica-greeter background "/usr/share/weebpapers/(Moe) Login Screen.png"
sudo -H -u lightdm gsettings set org.ArcticaProject.arctica-greeter theme-name "Moe-Pink15S"
sudo -H -u lightdm gsettings set org.ArcticaProject.arctica-greeter icon-theme-name "MoePinkIcons"

echo "$(eval_gettext "Configured login screen") ($(eval_gettext "Arctica Greeter"))."

fi
if [ -f "/usr/sbin/ukui-greeter" ]; then
echo "
$(eval_gettext "Configuring login screen") ($(eval_gettext "UKUI Greeter"))...
"

if ! grep -q '[Greeter]' /etc/lightdm/ukui-greeter.conf; then
    echo '[Greeter]' > /etc/lightdm/ukui-greeter.conf
fi
if ! grep -q 'background=' /etc/lightdm/ukui-greeter.conf; then
    echo 'background=/usr/share/weebpapers/(Moe) Login Screen.png' >> /etc/lightdm/ukui-greeter.conf
else
    sed -i 's/# background/background/g' /etc/lightdm/ukui-greeter.conf > /dev/null 2>&1
    sed -i 's/#background/background/g' /etc/lightdm/ukui-greeter.conf > /dev/null 2>&1
    sed -i 's%background=.*%background=/usr/share/weebpapers/(Moe) Login Screen.png%g' /etc/lightdm/ukui-greeter.conf > /dev/null 2>&1
fi
echo "$(eval_gettext "Configured login screen") ($(eval_gettext "UKUI Greeter"))."

fi
if [ -f "/usr/bin/sddm" ]; then
echo "
$(eval_gettext "Configuring login screen") ($(eval_gettext "SDDM"))...
"

for theme in /usr/share/sddm/themes/*; do
    cp -f "/usr/share/weebpapers/(Moe) Login Screen.png" "$theme/moeloginbg.png"
    kwriteconfig5 --file "$theme/theme.conf.user" --group General --key background "moeloginbg.png"
    kwriteconfig5 --file "$theme/theme.conf.user" --group General --key type "image"
    chmod 755 "$theme/moeloginbg.png" "$theme/theme.conf.user"
done
echo "$(eval_gettext "Configured login screen") ($(eval_gettext "SDDM"))."

fi

echo "
$(eval_gettext "Installing wallpapers...")
"

if [ -d "/usr/share/wallpapers" ] || [ -d "/usr/share/xfce4/backdrops" ] || [ -d "/usr/share/backgrounds" ] || [ -d "/usr/share/lubuntu/wallpapers" ]; then
IFS=$'\n'       # make newlines the only separator
if [ -d "/usr/share/wallpapers" ]; then
    ln -sf /usr/share/weebpapers /usr/share/wallpapers/FerenMoefier > /dev/null 2>&1
fi
for file in /usr/share/weebpapers/*; do
    if [ -d "/usr/share/xfce4/backdrops" ]; then
        ln -sf "$file" /usr/share/xfce4/backdrops/ > /dev/null 2>&1
    fi
    if [ -d "/usr/share/backgrounds" ]; then
        ln -sf "$file" /usr/share/backgrounds/ > /dev/null 2>&1
    fi
    if [ -d "/usr/share/lubuntu/wallpapers" ]; then
        ln -sf "$file" /usr/share/lubuntu/wallpapers/ > /dev/null 2>&1
    fi
done
IFS=$oldIFS
fi
    
if [ -d "/usr/share/color-schemes" ]; then
echo "
$(eval_gettext "Installing colour scheme...")
"

cat "$FULLPATH/resources/FerenMoefier.colors" > /usr/share/color-schemes/FerenMoefier.colors
chmod 755 -R /usr/share/color-schemes > /dev/null 2>&1
fi

    
if [ -d /usr/share/gnome-background-properties ]; then
    cp -f "$FULLPATH/resources/Moe-gnome.xml" /usr/share/gnome-background-properties/Moe-gnome.xml > /dev/null 2>&1
fi
if [ -d /usr/share/cinnamon-background-properties ]; then
    cp -f "$FULLPATH/resources/Moe-cinnamon.xml" /usr/share/cinnamon-background-properties/Moe-cinnamon.xml > /dev/null 2>&1
fi


if [ -d "/usr/share/plasma/look-and-feel" ]; then
echo "
$(eval_gettext "Installing Global Theme (KDE Plasma)...")
"

cp -Rf "$FULLPATH/resources/plasmagt" "/usr/share/plasma/look-and-feel/org.moe.default" > /dev/null 2>&1
if [ -d /usr/share/plasma/look-and-feel/org.feren.default ]; then
    cp -Rf /usr/share/plasma/look-and-feel/org.feren.default/contents/components /usr/share/plasma/look-and-feel/org.moe.default/contents/components
    cp -Rf /usr/share/plasma/look-and-feel/org.feren.default/contents/lockscreen /usr/share/plasma/look-and-feel/org.moe.default/contents/lockscreen
    cp -Rf /usr/share/plasma/look-and-feel/org.feren.default/contents/logout /usr/share/plasma/look-and-feel/org.moe.default/contents/logout
    cp -Rf /usr/share/plasma/look-and-feel/org.feren.default/contents/osd /usr/share/plasma/look-and-feel/org.moe.default/contents/osd
fi
chmod 755 -R "/usr/share/plasma/look-and-feel/org.moe.default" > /dev/null 2>&1
fi

echo "
$(eval_gettext "Installing postinst...")
"
cp -f "$FULLPATH/resources/ferenmoefierpostinst" "/usr/bin/ferenmoefierpostinst" > /dev/null 2>&1
chmod +x "/usr/bin/ferenmoefierpostinst" > /dev/null 2>&1
echo "
$(eval_gettext "Running postinst next login(s)...")
"
cd /home
for folder in *; do if id "$folder" &>/dev/null; then
    if [ ! -d "/home/$folder/.config" ]; then
        mkdir "/home/$folder/.config"; chown -h "$folder":"$folder" "/home/$folder/.config"
    fi
    if [ ! -d "/home/$folder/.config/autostart" ]; then
        mkdir "/home/$folder/.config/autostart"; chown -h "$folder":"$folder" "/home/$folder/.config/autostart"
    fi

    echo "[Desktop Entry]
Name=Moefier Postinst
Exec=/usr/bin/ferenmoefierpostinst
Terminal=false
NoDisplay=true
Icon=preferences-desktop-theme
Type=Application
X-KDE-autostart-after=panel" > "/home/$folder/.config/autostart/ferenmoepostinst.desktop"
    chown -h "$folder":"$folder" "/home/$folder/.config/autostart/ferenmoepostinst.desktop"
fi; done
cd /tmp/moecontents

echo "
$(eval_gettext "Updating Initramfs, and rebooting...")
"
update-initramfs -u -k all > /dev/null 2>&1 || dracut -f > /dev/null 2>&1

echo "$(eval_gettext "Enjoy.")"

sleep 0.2
    
rm -f /home/*/.cache/*.kcache
    
sync
    
rm -f /home/*/.cache/*.kcache
sync
    
echo b > /proc/sysrq-trigger #Trigger an INSTANT REBOOT
    
sleep 4
systemctl -i reboot #in case instant rebootn't
