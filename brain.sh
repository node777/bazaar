# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White
#echo -e "𝘐𝘯𝘪𝘵𝘪𝘢𝘭𝘪𝘻𝘪𝘯𝘨 𝘉𝘢𝘻𝘢𝘢𝘳 𝘕𝘦𝘵𝘸𝘰𝘳𝘬༺༻༼༽༾༿༒∘∙࿇༄༅༆༇༈༉༊་༌།༎༏༐༑༔༕༖༗༘༙༚༛༜༝༞༟༠༡༢༣༤༥༦༧༨༩༪༫༬◼◻◽◾⌗⌗⌗⌗⌗░▒▒▒▒▒▓▓▓█"
#echo -e "║░▒▒▒༎༎༎༎║╔══╬══╩═╗╝╝═╗║ ╚═╝╠╩╬╞┤ ║╛╘ ╝▒▒▒▒░║"
#echo -e "║╔═══╩═╗╝╝═╗║ ╚═╝╠╩╬╞┤ ║╛╘ ╝░░░░░░░░░░░░║"

prerequisites=("git" "curl" "docker" "docker-compose" "go" "node" "npm" "python" "screen")
missing=()
echo -e $BPurple

echo -e " ╔══════════════════⚪══════════════════╗ "
echo -e "╔╝░░░░░░░░░░░⚪⚪⚪⚪⚪ᘕ ❖ ᘔ⚪⚪⚪⚪⚪░░░░░░░░░░░╚╗"
echo -e "║░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░║"
echo -e "║░▒▒░ᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒ ░▒▒░║"
echo -e "║░▒░⌗⌗ Initializing Bazaar Network ⌗⌗░▒░║"
echo -e "║░▒▒░ᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒᨒ ░▒▒░║"
echo -e "║░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░║"
echo -e "╚╗░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░╔╝"
echo -e " ╚══════════════════⚪══════════════════╝ "

#Install Dependencies

for i in ${prerequisites[@]}
do
    echo -e $BPurple
    echo -e "Checking $i installation status"

    if ! [ -x "$(command -v $i)" ]; 
    then
        echo -e $Red
        echo "྾ $i is not installed." 
        missing+=($i)
    else
        #missing+=($i)
    
        echo -e $Green
        echo -e "$i is installed."

        if [[ $i == "go" ]]
        then
            $i version
        else
            $i --version
        fi
    fi
done

if [ -n "$missing" ]
then
    echo -e $Red
    echo "You are missing ${missing[*]}"
    echo "would you like to install now?"
    read -r -p "Are you sure? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        for i in ${missing[@]}
        do
            echo "installing $i"
            case $i in 
                screen)
                    echo "Installing"
                ;;
                *)
                    sudo apt-get install $i
                ;;
            esac
        done
    else
        echo "Can't do nothin' without the prereqs... \nCome back when you got it all figured out"
    fi

else
    echo -e $Green
    echo "Not missing any prerequisites. Continuing with Install"
fi

echo "setting up environment"