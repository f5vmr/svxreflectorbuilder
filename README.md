# SvxReflectorBuilder
<h1>Menu build for Raspberry Pi - Repeater or Hotspot node. EchoLink MetarInfo and SVXReflector Options</h1>
<h2> Pour l'instruction en Français, README_FR.md. Para instrucción en español README_ES.md.</h2>
<h3>Introduction</h3>
<p>This SVXReflector build provides a SvxReflector build, too which you can connect your svxlink nodes.</b>. It is for installation on a server that is expected to run 24/7 and provide connectivity for the community. If you are in the United Kingdom, please do not build another reflector, as the svxportal-uk.ddns.net:81 already provides unrestricted connection already.</p>
<p>A connection to the svxreflector provides connectivity using pseudo-talkgroups to other nodes and repeaters on the network. for more information select this link http://svxportal-uk.ddns.net:81.</p>
<p>This build has no dashboard, and everything is run headlessly, however if you want a dashboard such as that on the UK portal, then go to github.com/sa2blv/svxportal for all the relevant information.</p>
<p>Because there is no sound component for the svxreflector, the installation is extremely rapid, and is ready for immediate deployment after running the first and only instruction. However you will require to become bash shell script efficient to manage the program.
<h3>Your First Steps</h3>
<p><b>The Requirements:</b> A debian server, installed as Debian 12 Bookworm. This can be a Raspberry Pi, however for efficiency, you should consider a virtual machine installed on a hypervisor, with daily backup service. ProxMox is what I use, and is very efficient. Follow Proxmox advice on creating a server image with connectivity.</p>
<p>If you are suitably experienced, you will be able to modify the installation once it is complete. But this system will provide you with a working system, and you can then modify it to your own needs should you want to.</p>
<p>There are very few other images that work succesfully for this type of build, where there is a potential for using the application in several directions. An image is fixed, leaving you with a lot of puzzling. This is not an image, but a very easy build.</p>
<p>This New SVXREFLECTORKBUILDER uses an apt install, especially created to avoid the long and tedious approach of a compilation.</p>

<h2>THE INSTALLATION</h2>

<pFor this install, the user name is root with the password used for the installation of the operating system.</p> 
<p>
<h2>The Build</h2>
<b>As in most infestations, carry out apt update && apt upgrade -y to prepare for the software install.</b>

<p>Step 1: <b>apt install -y git</b> as without this you cannot download from the GitHub.</p>  

<p>Step 2: <b>git clone https://github.com/f5vmr/svxreflectorbuilder.git</b> that will take a matter of only seconds.</p>
<p>Step 3: <b>At the prompt type ./svxreflectorbuilder/preinstall.sh</b> </p>
<p>You need no input at this stage, until the system reports ready. It will take a while to complete, about 10 minutes.</p>
<p>Step 4: </p>

<p>They will guide you through the installation, all the way to run-time.</p>
<b>You will need to know before you begin</b> 

<b>Remember note everything down before you proceed.</b>
<p>Everything else will be constructed for you</p>
<h2>Beginning the install</h2>

<p>At the end of the compilation, the system will ready to use. You may now 'exit' the terminal.</p>

<p>The next step will be to open an internet browser such as 'Chrome' or 'Firefox' and type in the IP Address and enter. The dashboard will be displayed. If your USB soundcard is flashing then the node should be fully operational.</p>

<h2> Troubleshooting </h2>

<p>You will need to understand the svxlink.conf file and how to make adjustments for Simplex or Repeater operation. In any case you may need to refer to the svxlink.org main page, or svxlink amateur radio users page on facebook, or contact me. For further information also consult the svxlink pages on g4nab.co.uk. In the terminal, type 'man svxlink.conf' and the on-board documentation will be displayed.</p>

<p>To stop svxlink running type in the terminal <b>sudo systemctl stop svxlink.service</b> and to restart it type <b>sudo systemctl restart svxlink.service</b> You can also do this if authorised in the Dashboard at the POWER menu. You do not need to reboot the system at any time.</p>

<p>If you wish to modify the Svxlink.conf, EchoLink, MetarInfo and NodeInfo files, you can do so, if authorised, from the dashboard. Saving the changes immediately restarts the svxlink with the new setting, with the new changes show after a click on the button in the dashboard.</p>
<p>Be careful whilst editing, as to change the structure, can cause the node to fail. However a copy of the last working configuration can be found in the /var/www/html/backups folder with a time and date.</p>
<p>To obtain information for the node_info.json go to a PC Browser and enter <b>http://svxportal-uk.ddns.net:81</b> where you will find a dashboard.</p>
<p>Click <b>Register</b> at the top, completing the information. This information is held only to enable you to complete the next stage. Log in with the information you have just supplied, click on <b>My Stations</b>, and click on <b>Generate node_info.json</f></b>
<p>By completing all the information, <b>ignoring</b> any reference to CTCSS at this time, this will generate a file called node_info.json. Save it in a location in your computer. You can copy and paste from it later to the file in the node.</p>
<p>Open the terminal of the Raspberry Pi, and type <b>cd /etc/svxlink</b> followed by return. Then type <b>sudo nano node_info.json</b> and edit the information with the content of the file you have just saved on your PC. You can open the file with a text editor or notepad.</p>
<p>In the Raspberry Terminal or in the Dashboard if you have opened the NodeInfo file there, and delete all the contents. Go to the Notepad or text Editor and select all the text there, and copy (cntrl-c). Highlight the terminal (or the dashboard window) and paste (cntrl-v). </p>
<p>When the editing is complete type <b>cntrl-o</b> and return at the keyboard for the terminal followed by <b>cntrl-x</b>.</p>
<p>In the Dashboard, simply use the save button. The new information will be saved to the file in the node.</p>

<p>Check the content and importantly complete your location information near the bottom of the file. type <b>cntrl-o</b> and return then <b>cntrl-x</b> when finished to save your changes.</p>
<p>If you have not yet enabled Echolink in the <b>svxlink.conf</b> to may need to do this now, and remove the <b>#</b> comment header from the relevant lines simply by clicking on the check box. You can do this in the Svxlink Configurator</p>
<p>The restart of the svxlink.service is automatic on saving changes.</b></p>
<p>Do not make changes to the <b>gpio.conf</b>. The old methods of adding the gpio configuration and setting a daemon start in /etc/rc.local are deprecated (no longer required). We are using GPIOD or udev and they are set in the menus.</p>
<h2>EchoLink</h2>
<p>To modify the Echolink information, you can make your changes to your EchoLink Configurator here. then save the file as you did above with <b>svxlink.conf</b>.</p>
<p>The usual rules apply with the outgoing ports for your RaspberryPi IP address set in the Router to which you are connected</p>
<p>You can only have one EchoLink set up on your own home IP Address.</p>
<p>You will need to set up the callsign and password with which you registered in EchoLink.</p>
<p>If you did not set up EchoLink during the building phase, then you can add it the MODULES= line in the [SimplexLogic] section of the Svxlink Configurator and you must include ModuleEchoLink within the line. For the Repeater user the same will apply except the MODULES= line will be in [RepeaterLogic]</p>
<p>Finally the important step is to set the correct level of audio. This is now set using amixer in the menu at the top.<p>
<p>Alsamixer cannot be used by the dashboard so instead we address the amixer directly.</p>
<p> For best results, set 'Loudspeaker' to around 75, 'Mic' as 0 'Mic with Capture' at 19-38 and 'Autogain' should be 'OFF'. Simply adjust the values in the Configurator. </p>
<p>'Loudspeaker' is your transmitter volume, and 'Mic with capture' is the volume from the receiver. It is a little contra-intuitive.</p>
<p>Have an interesting day</p>

<p>73 - Chris G4NAB </p>
<p>Everything introduced here is directly from the original presentation by Tobias SM0SVX.</p>

<h2>Addendum</h2>
<p>Talk Groups should be added to the Svxlink Configurator in ReflectorLogic, and ensure the tick is checked alongside.</p>
<p>Airports can be added and removed as required in the MetarInfo Configurator.</p
<p>The Audio dashboard seems not to work for the moment.</p>
<p>Module EchoLink can be added throught the dashboard, in the EchoLink configurator first of all, then add ModuleEchoLink to the MODULES= line in the [SimplexLogic] or [RepeaterLogic] section of the Svxlink Configurator.</p>
<p>Amixer can be adjusted using the dashboard, and is more efficient than alsamixer in the terminal. Select the recommended settings within the window.</p> 
<p>This feature does not work for the usvxcard by F8ASB. You should go to the terminal and type sudo alsamixer. Reduce all settings to around 60%.</p>
<p>Finally for the F8ASB users, tuning the SA818 module.</p>
<p>You should have by now enabled the USB interface, that in the Raspberry Pi menu, should be /dev/ttyS0. </p>
<p>sudo git clone https://github.com/0x9900/sa818</p>
<p>cd sa818</p>
<p>sudo python3 setup.py install</p>
<p>sa818 --port /dev/ttyS0 radio --frequency 430.125 --squelch 2 --bw 0</p>
<p>This command is simply to communicate with the serial port to set the radio to frequency 430.125 MHz with squelch level 2 and bandwidth 12.5 kHz. Of course substitute your own frequency. for full assistance on the SA818 type SA818 -h for all the options. </p>
