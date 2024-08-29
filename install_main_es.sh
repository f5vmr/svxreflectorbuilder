#!/bin/bash
lang=$(echo $LANG | grep -o '^[a-zA-Z]*_[a-zA-Z]*')
#### Define Variables ####
CONF="/etc/svxlink/svxlink.conf"
MODULE="/etc/svxlink/svxlink.d"
OP=/etc/svxlink
export HOME
#### Welcome Message ####
source "${BASH_SOURCE%/*}/functions/welcome_es.sh"
welcome
source "${BASH_SOURCE%/*}/functions/configure_es.sh"
configure
#### USB SOUND CARD ####
source "${BASH_SOURCE%/*}/functions/sound_card_es.sh"
soundcard
#### NODE Selection ####
source "${BASH_SOURCE%/*}/functions/node_type_es.sh"
nodeoption
echo -e "$(date)" "${YELLOW} #### Node Type: $NODEOPTION #### ${NORMAL}" | tee -a  /var/log/install.log

echo -e "$(date)" "${YELLOW} #### Sound Card: $HID $GPIOD $card #### ${NORMAL}" | tee -a  /var/log/install.log	
echo -e "$(date)" "${YELLOW} #### Checking Alsa #### ${NORMAL}" | tee -a  /var/log/install.log

#### REQUEST CALLSIGN ####
source "${BASH_SOURCE%/*}/functions/callsign_es.sh"
callsign
#### GROUPS AND USERS ####
# clear
echo -e "$(date)" "${YELLOW} #### Creating Groups and Users #### ${NORMAL}" | tee -a  /var/log/install.log
source "${BASH_SOURCE%/*}/functions/groups.sh"
make_groups

#### CONFIGURATION VOICES ####
 # clear
	echo -e "$(date)" "${GREEN} #### Installing Voice Files #### ${NORMAL}" | tee -a  /var/log/install.log

 	cd /usr/share/svxlink/sounds

	git clone https://github.com/ea5gvk/es_ES.git

  	cd /etc/svxlink
   chmod 775 -R *

#### BACKUP CONFIGURATION ####
 # clear
	echo -e "$(date)" "${GREEN} #### Copia de seguridad de la configuración en: $CONF.bak #### ${NORMAL}"| tee -a  /var/log/install.log

 	if [ -f "$CONF" ]; then
    cp -p "$CONF" "$CONF.bak"
else
    echo "File $CONF does not exist."
fi

##
 	cd /home/pi/
		SUDOERS_FILE="/etc/sudoers.d/svxlink"
	SOURCE_FILE="svxlinkbuilder/www-data.sudoers"
	if [ ! -f "$SOURCE_FILE" ]; then
  whiptail --title "Error" --msgbox "Source file $SOURCE_FILE does not exist. Exiting." 8 78
  exit 1
fi

# Check if the sudoers file exists
if [ -f "$SUDOERS_FILE" ]; then
  : > "$SUDOERS_FILE"
else
  touch "$SUDOERS_FILE"
fi

# Ensure the sudoers file has the correct permissions


# Read the content from the source file into the sudoers file
cat "$SOURCE_FILE" > "$SUDOERS_FILE"
chmod 0440 "$SUDOERS_FILE"
 	echo -e "$(date)" "${RED} #### Descarga de archivos de configuración preparados desde los scripts #### ${NORMAL}" | tee -a  /var/log/install.log
 	mkdir /home/pi/scripts
	cp -f /home/pi/svxlinkbuilder/addons/10-uname /etc/update-motd.d/
 	cp -f /home/pi/svxlinkbuilder/configs/svxlink.conf /etc/svxlink/
 	cp -f /home/pi/svxlinkbuilder/addons/node_info.json /etc/svxlink/node_info.json
 	cp -f /home/pi/svxlinkbuilder/resetlog.sh /home/pi/scripts/resetlog.sh
 	(crontab -l 2>/dev/null; echo "59 23 * * * /home/pi/scripts/resetlog.sh ") | crontab -
	mkdir /usr/share/svxlink/events.d/local
	cp /usr/share/svxlink/events.d/*.tcl /usr/share/svxlink/events.d/local/
    cp -f /home/pi/svxlinkbuilder/configs/Logic.tcl /usr/share/svxlink/events.d/local/Logic.tcl
    sed -i '/^LINK=\/adds\/dataserver_current\/httpparam/ c\LINK=/cgi-bin/data/dataserver.php?requestType=retrieve&dataSource=metars&hoursBeforeNow=3&stationString=' $MODULE/ModuleMetarInfo.conf
# clear
	echo -e "$(date)" "${GREEN} #### Establecer indicativo en $CALL #### ${NORMAL}" | tee -a  /var/log/install.log

 	sed -i "s/MYCALL/$CALL/g" $CONF
 	sed -i "s/MYCALL/$CALL/g" /etc/svxlink/node_info.json

	echo -e "$(date)" "${GREEN} #### Configuración del tiempo de suspensión del silenciador en 10 mS ${NORMAL}" | tee -a  /var/log/install.log
 	sed -i s/SQL_HANGTIME=2000/SQL_HANGTIME=10/g $CONF
 
 # clear	
	echo -e "$(date)" "${YELLOW} #### Desactivar mensajes de advertencia de distorsión de audio #### ${NORMAL}"| tee -a  /var/log/install.log


 	sed -i 's/PEAK_METER=1/PEAK_METER=0/g' $CONF

 # clear
	echo -e "$(date)" "${GREEN} #### Actualización de SplashScreen al iniciar #### ${NORMAL}" | tee -a  /var/log/install.log

 	sed -i "s/MYCALL/$CALL/g" /etc/update-motd.d/10-uname
 	chmod 0775 /etc/update-motd.d/10-uname

 # clear
	echo -e "$(date)" "${YELLOW} #### Cambiar el sufijo del archivo de registro ${NORMAL}" | tee -a  /var/log/install.log

 		sed -i '/^LOGFILE=/ { /[^.log]$/ s/$/.log/ }' /etc/default/svxlink

	#### INSTALLING DASHBOARD ####
 # clear
	cd /home/pi
	echo -e "$(date)" "${YELLOW} #### Comprobación de direcciones IP #### ${NORMAL}" | tee -a  /var/log/install.log
	
	source "${BASH_SOURCE%/*}/functions/get_ip.sh"
	ipaddress
 # clear
	cd /home/pi
	echo -e "$(date)" "${YELLOW} #### Instalación del panel #### ${NORMAL}" | tee -a  /var/log/install.log

	source "${BASH_SOURCE%/*}/functions/dash_install_es.sh"
dash_install
 # clear
	echo -e "$(date)" "${GREEN} #### Panel instalado #### ${NORMAL}" | tee -a  /var/log/install.log
	whiptail --title "Adresses IP" --msgbox "Tablero instalado. Tenga en cuenta que su dirección IP es $ip_address en $device" 8 78
	cd /home/pi/

	 # clear
	echo -e "$(date)" "${GREEN} #### Configurando el nodo #### ${NORMAL}" | tee -a  /var/log/install.log
	source "${BASH_SOURCE%/*}/functions/node_setup_es.sh"
	nodeset
	#### Removal of unwanted files ####
	#echo -e "$(date)" "${YELLOW} #### Removing unwanted files #### ${NORMAL}" | tee -a  /var/log/install.log
	#source "${BASH_SOURCE%/*}/functions/deletion.sh"
	#delete
	#### TIME SELECTION ####
    source "${BASH_SOURCE%/*}/functions/time_selection_es.sh"
    timeselect
	#### Identification setup ####
	echo -e "$(date)" "${GREEN} #### Identification setup  #### ${NORMAL}" | tee -a  /var/log/install.log
	source "${BASH_SOURCE%/*}/functions/announce_es.sh"
	announce
	echo -e "$(date)" "${GREEN} #### Announcement setup complete  #### ${NORMAL}" | tee -a  /var/log/install.log
	source "${BASH_SOURCE%/*}/functions/tones_es.sh"
	tones
	echo -e "$(date)" "${GREEN} #### Tones setup complete  #### ${NORMAL}" | tee -a  /var/log/install.log	
	
	cd /home/pi
	 # clear
 	echo -e "$(date)" "${RED} #### Cambiando el móduloMetar Link #### ${NORMAL}" | tee -a  /var/log/install.log
source "${BASH_SOURCE%/*}/functions/modulemetar_setup_es.sh"
modulemetar
	
	 # clear
	 cd /home/pi/
	echo -e "$(date)" "${RED} #### Cambio de ModuleEchoLink  #### ${NORMAL}" | tee -a  /var/log/install.log
source "${BASH_SOURCE%/*}/functions/echolink_setup_es.sh"
echolinksetup
	
	 # clear
#	echo -e "$(date)" "${RED} #### Changing ModulePropagationMonitor #### ${NORMAL}" | tee -a  /var/log/install.log
#	source "${BASH_SOURCE%/*}/functions/propagationmonitor_setup.sh"
#	propagationmonitor
	
	 # clear
	echo -e "$(date)" "${RED} #### Reinicie svxlink.service #### ${NORMAL}" | tee -a  /var/log/install.log	
	
 	systemctl restart svxlink.service

    ##.service isn't necessary ##
echo -e "$(date)" "${GREEN} #### Instalación completa #### ${NORMAL}" | tee -a  /var/log/install.log
whiptail --title "Instalación completa" --msgbox "Instalación completa. Vayamos al panel " 8 78
echo -e "$(date)" "${RED} #### Complete #### ${NORMAL}" | tee -a  /var/log/install.log

#exit




	
 
