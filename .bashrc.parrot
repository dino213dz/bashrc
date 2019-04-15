# .bashrc

##############################################################
#mes variabbles de couleur
COL_BLEU_SUR_STD="\033[0;34m"
COL_ROUGE_SUR_STD="\033[0;31m"
COL_BLANC_SUR_MAGENTA="\033[0;45m"
COL_JAUNE_SUR_STD="\033[0;33m"
COL_JAUNE_SUR_ROUGE="\033[41;33m"
COL_CYAN_SUR_STD="\033[0;36m"
COL_CYAN_SUR_BLEU="\033[44;36m"
COL_JAUNE_SUR_BLEU="\033[44;33m"
COL_NOIR_SUR_BLANC="\033[47;30m"
COLOR_RESET="\033[0m"

##############################################################
# Alias de mise en forme et de coloration
alias ifconfig='grc ifconfig'
alias date='date +"On est le %A %d %B %Y et il est %X"'
alias ip='grc ip'
alias systemctl='grc systemctl'
alias dig='grc dig'


# Alias easy shell
alias cd..='cd ..'
alias rm='rm -iv --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias ll='grc ls -lh'
alias la='grc ls -alh'
alias ls='grc ls -h '

#administration
alias kill='kill -9'
alias ps='grc ps'
alias psx='grc ps -aux | grep'
alias psau='ps -au'
alias psaux='ps -aux'
alias free='grc free -h'
alias mem='free'
alias servicesactifs='systemctl list-unit-files -t service | grep enabled'
alias cls='clear'
alias rechercher='echo "Resultats:";cd /;find -name'
alias hist='history'
alias man='LANG=fr_FR.UTF-8 man'
alias du='grc du -c -h -d 1 --exclude="*/proc/*"'
alias df='grc df -h'

#archivage
alias archiver='tar jcvf'
alias desarchiver='tar zxvf'
alias zipper='archiver'
alias dezipper='desarchiver'

#Webmaster
alias apache='service apache2'
alias irc='service ircd-irc2'

#Partitions
alias lvdisplay='lvdisplay -C -O lv_name'
alias vgdisplay='vgdisplay -C -O vg_name'
alias pvdisplay='pvdisplay -C -O pv_name'


#Net and LAN
alias lapute='echo "Patience...";grc netstat -lapute'
alias plantu='echo "Patience...";grc netstat -plantu'
alias ipconfig='ifconfig'
alias ifconfig='grc ifconfig'
alias iwconfig='grc iwconfig'
alias iptab='iptables -vnL --line-number'
alias iptabfilter='iptables -t filter -vnL --line-number'
alias iptabnat='iptables -t nat -vnL --line-number'
alias iptabmangle='iptables -t mangle -vnL --line-number'

#Edition rapide
alias edit='vim'
alias editbashrc='vim ~/.bashrc'
alias sourcebashrc='source ~/.bashrc'

#grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#VBox tools
alias mountshares='mount -t vboxsf Temp /mnt/Temp/'

#REHL Distribs
alias yum='yum --color=always'

#DEBIANS:
alias net='/etc/init.d/networking'
alias netstop='/etc/init.d/networking stop'
alias netstart='/etc/init.d/networking start'
alias netrestart='/etc/init.d/networking restart'
alias netrs='/etc/init.d/networking restart'
alias netreload='/etc/init.d/networking reload'
alias netrl='/etc/init.d/networking reload'

#KALI 
alias airgeddon='/root/scripts/airgeddon/airgeddon.sh'
alias fluxion='/root/scripts/fluxion-master/fluxion.sh'
alias nessus='/etc/init.d/nessusd'
alias mitmap='sudo python3 /root/scripts/mitmAP/mitmAP.py'
alias mitmAP=mitmap
alias dauth='airmon-ng -0 0 '
alias fauth='airmon-ng -1 120 '
alias aircrack='aircrack-ng -a2 '
alias boostwlan0='iw reg B0;iwconfig wlan0 txpower 30'
alias boostwlan1='iw reg B0;iwconfig wlan0 txpower 30'

#applications specifiques
alias google-chrome='google-chrome --no-sandbox'
alias chrome='google-chrome'

##############################################################
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

##############################################################
#PATH personnel
PATH=$PATH:~/scripts

##############################################################
#Ligne de commande colorée
#PS1="\[${COL_JAUNE_SUR_ROUGE}\][\t]\[${COL_BLANC_SUR_MAGENTA}\][\u@\h]\[${COL_JAUNE_SUR_BLEU}\][\w][\$]\[${COLOR_RESET}\] \[${COL_ROUGE_SUR_STD}\] \n> \[${COLOR_RESET}\]"

PS1="\[\033[0;32m\]\342\224\214\342\224\200\[┤\]$(if [[ ${EUID} == 0 ]]; then echo '\[\033[02;41;31m\]root\[\033[02;43;33m\]\[☻\]\[\033[02;46;36m\]\h\[™\]'; else echo '\[\033[0;31m\]\u\[\033[01;33m\]\[☺\]\[\033[01;96m\]\h\[™\]'; fi)\[\033[0;32m\]\[├~~♥~~┤\]\[\033[2;4;35m\]\w\[\033[0;32m\]\[├►\$(if [[ \$? != 0 ]]; then echo \"\[\033[1;5;31m\]\[♪♫‼\]\[\033[0;32m\]\"; else echo \"\[\033[0;32m\]\[♪♫\]\[\033[0;32m\]\";fi)\]\n\[\033[0;32m\]\342\224\224\342\224\200\342\224\200\[►\]\[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\] \[\033[37m\]"

##############################################################
#Historique coloré
export HISTTIMEFORMAT=`echo -e "\033[0m\033[1;32m■─┤\033[02;91m%F\033[01;33m☻\033[02;96m%T\033[0m\033[1;3;32m├────► \033[0;3;35m"`

#taille Historique
export HISTSIZE=2213
shopt histappend > /tmp/null

##############################################################
#activaton du verouillage numerique du clavier
if [ "$SSH_CONNECTION" = "" ]
then
liste_tty=/dev/tty[1-8]
for tty in $liste_tty; do setleds -D +num < $tty; done
#setleds +num -scroll -caps
fi
#/etc/init.d/keyboard.sh

##############################################################
#script qui affiche les infos systeme
#/etc/init.d/neofetch

##############################################################
#Montage du lecteur partagé virtual box
#deja_monte=$(mount -l | grep 'Temp on /mnt/Temp type vboxsf')
#if [ "$deja_monte" != "" ]
#then
#echo -en '${COL_JAUNE_SUR_STD}Lecteur partagé "Temp" est déjà monté  sur "/mnt/Temp" !${COLOR_RESET}'
#else
#echo -en '${COL_JAUNE_SUR_STD}Le lecteur partagé "Temp" a été monté sur "/mnt/Temp" !${COLOR_RESET}'
#mount -t vboxsf Temp /mnt/Temp
#fi



clear
