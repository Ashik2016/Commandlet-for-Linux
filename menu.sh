#!/bin/bash
clear cat
echo LOADING!!!
echo -ne '#########  (15%)\r'
sleep 1
echo -ne '########################## (30%)\r'
sleep 1
echo -ne '############################################## (60)\r'
sleep 1
echo -ne '######################################################################### (80%)\r'
sleep 1
echo -ne '####################################################################################### (100%)\r'
sleep 1
echo -ne '\n'
clear

##=================================================================================================================================================================================================##
echo =================================================================================
echo                               Command Menus
echo =================================================================================
echo
IFS=$'\n' ## assigns new line
saveIFS=$IFS  
PS3='Please enter your choice:'
options=("systeminfo" "hardwareinfo" "pciinfo" "securecopy" "logininfo" "uptime" "cronjobs" "pwd" "service restart" "ping" "uncompress(bz2)" "uncompress(gz)" "compress(tar)" "Quit")
hardwareinfo=lshw
pcinfo=lspci
userlogedin=pinky
uptime=uptime
print=pwd
#========================================================================================================================================================================================================#

select opt in "${options[@]}"
do
 IFS=$saveIFS                                                                                                                                                                                                                                                                                                                             
 case $opt in
        "systeminfo")
          uname -a 
           ;;
        "hardwareinfo")
          $hardwareinfo
           ;;
        "pciinfo")
          $pcinfo
           ;;
        "securecopy")
	 echo Enter remote user\'s name:
         read username
         echo  Enter remote user\'s IP or domain name:
         read ip
         echo Enter full path of remote file:
         read path
         echo Enter path to be saved:                                   # Switch section
         read savepath
         scp $username@$ip:$filepath $savepath
           ;;
        "logininfo")
          $userlogedin
           ;;
        "uptime")
          $uptime
           ;; 
        "cronjobs")
          crontab -l
           ;;
        "pwd")
          $print
           ;;
        "service restart")
	 echo Enter service name:
         read service
         systemctl restart $service
	   ;;
        "ping")
          echo Enter IP or domain name:
          read ip
          ping $ip
           ;;
        "uncompress(bz2)")
          echo Enter file path:
          read filepath
          echo Enter file name:
          read filename
          echo Enter path to be extracted:
          read path
          echo -ne '#####                 (33%)\r'
          sleep 1
          echo -ne '##############        (66%)\r'
          sleep 1
          echo -ne '####################  (100%)\r'
          echo -ne '\n'
          tar -jxvf $filepath/$filename -C $path
           ;;
        "uncompress(gz)")
         echo Enter file path:
         read filepath
         echo Enter file name:
         read filename
         echo Enter path to be extracted:
         read path
         echo -ne '#####                 (33%)\r'
         sleep 1
         echo -ne '##############        (66%)\r'
         sleep 1
         echo -ne '####################  (100%)\r'
         echo -ne '\n' 
         tar -zxvf $filepath/$filename -C $path
           ;;
        "compress(tar)")
         echo Enter file name for compression:
         read filename 
         echo Enter path which need to be compressed:
         read path 
         tar -cvf $filename $path 
           ;;
        "Quit")
           break
           ;;
         *) echo Invalid option;;	
 esac
done
