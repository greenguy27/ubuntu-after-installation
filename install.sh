ERROR_COUNTER=0
ERROR_MESSAGE="Problem with: "

function print_header {
	echo
	echo
	echo
	echo "========================================="
	echo "$1"
	echo "========================================="
	echo
}

function install_program {
	sudo apt-get install -y $1
	OUT=$?
	if [ $OUT -ne 0 ] ; then
		if [ $ERROR_COUNTER -eq 0 ] ; then
			ERROR_MESSAGE=$ERROR_MESSAGE$1
		else
			ERROR_MESSAGE=$ERROR_MESSAGE", "$1
		fi
		ERROR_COUNTER=`expr $ERROR_COUNTER + 1`
	fi
}

function full_install_program {
	print_header "$1"
	install_program $2
}

function update {
	sudo apt-get update	
	OUT=$?
	if [ $OUT -ne 0 ] ; then
		exit 1;	
	fi
}

sudo add-apt-repository "deb http://archive.canonical.com/ maverick partner"
update
###################################
#
# system tools
#
###################################

full_install_program "install tux commander..." "tuxcmd"
full_install_program "install mc..." "mc"
full_install_program "install rar..." "rar"
full_install_program "install unrar..." "unrar"
full_install_program "install zip..." "zip"
full_install_program "install unzip..." "unzip"
full_install_program "install 7zip..." "p7zip-full"
full_install_program "install curl..." "curl"
full_install_program "install cisco vpn..." "network-manager-vpnc"
full_install_program "install open vpn..." "network-manager-openvpn"
full_install_program "install mesa utils..." "mesa-utils"
full_install_program "install deborphan..." "deborphan"
full_install_program "gedit plugins..." "gedit-plugins"

###################################
#
# programs
#
###################################
full_install_program "install pidgin..." "pidgin"
full_install_program "install skype..." "skype"
full_install_program "install compizconfig-settings-manager" "compizconfig-settings-manager"
full_install_program "install alltray..." "alltray"
full_install_program "isntall flash plugin..." "flashplugin-nonfree"
full_install_program "install conky..." "conky"
full_install_program "install chromium browser..." "chromium-browser"
full_install_program "install chromium browser open codecs..." "chromium-codecs-ffmpeg"
full_install_program "install chromium browser..." "chromium-codecs-ffmpeg-nonfree"
full_install_program "install gimp..." "gimp"
full_install_program "install wine..." "wine"
full_install_program "install winetricks..." "winetricks"
full_install_program "install myspell-pl" "myspell-pl"
full_install_program "install mplayer..." "mplayer"
full_install_program "install mplayer-fonts..." "mplayer-fonts"
full_install_program "install mplayer codecs w32codecs..." "w32codecs"
full_install_program "install mplayer codecs libdvdcss2..." "libdvdcss2"


###################################
#
# programming tools
#
###################################
full_install_program "install build-essential..." "build-essential"
full_install_program "install git..." "git-core"
full_install_program "install svn..." "subversion"
full_install_program "install java 6 jre..." "sun-java6-jre"
full_install_program "install java 6 jdk..." "sun-java6-jdk"
full_install_program "install java 6 plugin..." "sun-java6-plugin"
full_install_program "install java 6 fonts..." "sun-java6-fonts"

echo
if [ $ERROR_COUNTER -gt 0 ] ; then
	echo $ERROR_MESSAGE
	echo
	exit 1;
else
	echo "OK!"
fi

exit 0;

