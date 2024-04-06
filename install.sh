#### INSTALLATION SCRIPT ####
# Setting non-superuser elements #
#### INITIALISE ####
cd svxlink_install	 	
clear
source "${BASH_SOURCE%/*}/functions/initialise.sh"
initialise
#### CHECK OS ####
source "${BASH_SOURCE%/*}/functions/check_os.sh"
check_os
#### CHECK USER ####
source "${BASH_SOURCE%/*}/functions/check_user.sh"
usercheck
#### SuperUser Install ####
sudo ./install_main.sh
