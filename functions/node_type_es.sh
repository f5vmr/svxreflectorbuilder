#!/bin/bash
node=""
function nodeoption {
    NODE_OPTION=$(whiptail --title "Svxlink" --menu "¿Elija el tipo de nodo que desea?" 14 78 5 \
            "1" " Nodo simplex sin SvxReflector" \
            "2" " Nodo simplex con SvxReflector" \
            "3" "Nodo repetidor sin SvxReflector" \
            "4" "Nodo repetidor con SvxReflector" 3>&1 1>&2 2>&3)

    if [[ "$NODE_OPTION" -eq "1" ]] 
    then
        echo -e "${CYAN}Elija Nodo Simplex sin SvxReflector ${WHITE}" | tee -a /var/log/install.log
    elif [[ "$NODE_OPTION" -eq "2" ]] 
    then
        echo -e "${CYAN}Elija Nodo Simplex con SvxReflector ${WHITE}" | tee -a /var/log/install.log
    elif [[ "$NODE_OPTION" -eq "3" ]] 
    then
        echo -e "${CYAN}Elija Nodo repetidor sin SvxReflector ${WHITE}" | tee -a /var/log/install.log
    elif [[ "$NODE_OPTION" -eq "4" ]] 
    then
        echo -e "${CYAN}Elija Nodo repetidor con SvxReflector ${WHITE}" | tee -a /var/log/install.log
    else 
        echo -E "${RED}Ninguna opción elegida ${WHITE}" | tee -a /var/log/install.log
fi
echo "${GREEN}Node Option ${WHITE} $NODE_OPTION"
export NODE_OPTION; 
}
            
