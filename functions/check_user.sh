#!/bin/bash
## Function to check the user

function usercheck {
    ## Get the current user
    current_user=$(logname) | tee -a   /var/log/install.log
    
    ## Check if the current user is 'pi'
   if [[ "$logname" != "pi" ]] 
   then 
   echo -e "${RED}Please the reformat the SDcard as user pi ${NORMAL}" ; exit; 

    else whiptail --title "OS and user check" --msgbox "OS is $operating_system and User is $logname" 8 78;
fi
echo -e "${GREEN} #### User is pi as required #### ${NORMAL}" | tee -a /var/log/install.log
# clear

}

