# SvxReflectorBuilder
<h1>Menu build for a server-based SvxReflector</h1>
<h2> Pour l'instruction en Français, README_FR.md. Para instrucción en español README_ES.md.</h2>
<h3>Introduction</h3>
<p>This SVXReflector build provides a service, to which you can connect your svxlink nodes.</b>. It is for installation on a server that is expected to run 24/7 and provide connectivity for the community of svxlink nodes. If you are in the United Kingdom, please do not build another reflector, as the svxportal-uk.ddns.net:81 already provides unrestricted connection.</p>
<p>A connection to the svxreflector provides connectivity using pseudo-talkgroups to other nodes and repeaters on the network. for more information select this link http://svxportal-uk.ddns.net:81.</p>
<p>This build has no dashboard, and everything is run headlessly, however if you want a dashboard such as that on the UK portal, then go to github.com/sa2blv/svxportal for all the relevant information.</p>
<p>Because there is no sound component for the svxreflector, the installation is extremely rapid, and is ready for immediate deployment after running the first and only instruction. However you will require to become bash shell script efficient to manage the program.
<h3>Your First Steps</h3>
<p><b>The Requirements:</b> A debian server, installed as Debian 12 Bookworm. This can be a Raspberry Pi, however for efficiency, you should consider a virtual machine installed on a hypervisor, with daily backup service. ProxMox is what I use, and is very efficient. Follow Proxmox advice on creating a server image with connectivity.</p>
<p>If you are suitably experienced, you will be able to modify the installation once it is complete. But this system will provide you with a working model, and you can then modify it to your own needs should you want to.</p>
<p>There are very few other images that work succesfully for this type of build, where there is a potential for using the application in several directions. An image is fixed, leaving you with a lot of puzzling. This is not an image, but a very easy build.</p>
<p>This New SVXREFLECTORBUILDER uses an apt install, especially created to avoid the long and tedious approach of a compilation.</p>

<h2>THE INSTALLATION</h2>

<p>For this install, the user name is 'root' with the password used for the installation of the operating system.</p> 
<p>
<h2>The Build</h2>
<b>As in most installations, carry out apt update && apt upgrade -y to prepare for the software install.</b>

<p>Step 1: <b>apt install -y git</b> as without this you cannot download from the GitHub.</p>  

<p>Step 2: <b>git clone https://github.com/f5vmr/svxreflectorbuilder.git</b> This will take a matter of only seconds.</p>
<p>Step 3: <b>At the prompt type ./svxreflectorbuilder/preinstall.sh</b> </p>
<p>You need no input at this stage, until the system reports ready. It will take a while to complete, about 10 minutes. Answer any questions in the menu.</p>


<p>At the end of the compilation, the system will ready to use. You may now edit the svxreflector.conf.</p>

<p><&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08> <&08>
The next step will be to open an internet browser such as 'Chrome' or 'Firefox' and type in the IP Address and enter. The dashboard will be displayed.</p>

<h2> Troubleshooting </h2>

<p>You will need to understand the svxreflector.conf file and how to make adjustments for New and current users. In any case you may need to refer to the svxlink.org main page, or svxlink amateur radio users page on facebook, or contact me. For further information also consult the svxlink pages on g4nab.co.uk. In the terminal, type 'man svxreflector.conf' and the on-board documentation will be displayed.</p>

<p>To stop svxlink running type in the terminal <b>systemctl stop svxreflector</b> and to restart it type <b>systemctl restart svxlink.service</b></p>

<p>73 - Chris G4NAB </p>

<p>Everything introduced here is directly from the original presentation by Tobias SM0SVX.</p>

<h2>Addendum</h2>
