DEFAULT_ANCHOR = '34.66.246.55'
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

#OLD-prerequisites=("apt-transport-https" "ca-certificates" "software-properties-common" "git" "curl" "docker" "docker-compose" "go" "python" "node" "npm")
prerequisites=("apt-transport-https" "ca-certificates" "software-properties-common" "git" "curl" "docker")
missing=()
echo -e $BPurple

echo -e " ╔══════════════════○══════════════════╗ "
echo -e "╔╝░░░░░░░░░░░○○○○○x ❖ x○○○○○░░░░░░░░░░░╚╗"
echo -e "║░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░║"
echo -e "║░▒▒░○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○░▒▒░║"
echo -e "║░▒░○○ Initializing Bazaar Network ○○░▒░║"
echo -e "║░▒▒░○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○░▒▒░║"
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

        if [ $i == "go" ]
        then
            $i version
        else
            $i --version
        fi
    fi
    echo -e $Color_Off
done

if [ -n "$missing" ]
then
    echo -e $BRed
    echo "You are missing the following dependencies:" 
    
        for i in ${missing[@]}
        do
            echo "$missing[$i]"
        done

    read -r -p "would you like to install as anchor? [y/N] " response
    echo -e $Color_Off
    
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        for i in ${missing[@]}
        do
            echo "installing $i"
            case $i in 
                docker)
                    apt update
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
                    apt update
                    apt-get install docker-ce

                    curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    chmod +x /usr/local/bin/docker-compose

                    usermod -aG docker ${USER}
                ;;
                *)
                    apt-get update
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

echo -e $BYellow
read -r -p "would you like to set up environment now? [y/N] " response
echo -e $Color_Off
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    read -r -p "would you like to set up environment as anchor peer? [y/N] " response

    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        read -r -p "Please enter the orgs you would like to set up, seperated by a space: " orgList
        echo "setting up environment..."
        git clone https://github.com/traplizard/bazaar-core
        cd bazaar-core
        #start reg
        ./extra/docker-registry-local/start-docker-registry-local.sh
        #
        ./host-create.sh $orgList
    else
        read -e -p "Enter anchor IP: " -i "34.66.246.55" ANCHOR_IP
        git clone https://github.com/traplizard/bazaar-core
        cd bazaar-core
        export BOOTSTRAP_IP='34.66.246.55'
        ./network-create.sh test-org
    fi
fi
#curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | bash
#go get github.com/hyperledger/fabric-chaincode-go/shim