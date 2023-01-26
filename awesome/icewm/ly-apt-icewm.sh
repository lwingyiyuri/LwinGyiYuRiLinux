sleep 5 &
pid=$!

          #LWINGYI && YURI#1
          printf "\r W"
          sleep 0.5
          #LWINGYI && YURI#2
          printf "\r We"
          sleep 0.5
          #LWINGYI && YURI#3
          printf "\r Wel"
          sleep 0.5
          #LWINGYI && YURI#4
          printf "\r Welc"
          sleep 0.5
          #LWINGYI && YURI#5
          printf "\r Welco"
          sleep 0.5
          #LWINGYI && YURI#6
          printf "\r Welcom"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome T"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To I"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To IC"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICE"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEW"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM"
          sleep 0.5
          printf "\r Welcome  To ICEWM W"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Wi"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Win"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Wind"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Windo"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window M"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window Ma"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window Man"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window Mana"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window Manag"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window Manage"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To ICEWM Window Manager"
          sleep 0.5
          
          sleep 5 &
          pid=$!
          #LWINGYI && YURI#1
          printf "\r S"
          sleep 0.5
          #LWINGYI && YURI#2
          printf "\r SC"
          sleep 0.5
          #LWINGYI && YURI#3
          printf "\r SCR"
          sleep 0.5
          #LWINGYI && YURI#4
          printf "\r SCRI"
          sleep 0.5
          #LWINGYI && YURI#5
          printf "\r SCRIP"
          sleep 0.5
          #LWINGYI && YURI#6
          printf "\r SCRIPT"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r SCRIPT©"
          sleep 0.5
          #LWINGYI && YURI#8
          printf "\r SCRIPT©B"
          sleep 0.5
          #LWINGYI && YURI#9
          printf "\r SCRIPT©BY"
          sleep 0.5
          #LWINGYI && YURI#10
          printf "\r SCRIPT©BY L"
          sleep 0.5
          #LWINGYI && YURI#11
          printf "\r SCRIPT©BY Lw"
          sleep 0.5
          #LWINGYI && YURI#12
          printf "\r SCRIPT©BY Lwi"
          sleep 0.5
          #LWINGYI && YURI#13
          printf "\r SCRIPT©BY Lwin"
          sleep 0.5
          #LWINGYI && YURI#14
          printf "\r SCRIPT©BY LwinG"
          sleep 0.5
          #LWINGYI && YURI#15
          printf "\r SCRIPT©BY LwinGy"
          sleep 0.5
          #LWINGYI && YURI#16
          printf "\r SCRIPT©BY LwinGyi"
          sleep 0.5
          #LWINGYI && YURI#17
          printf "\r SCRIPT©BY LwinGyi&"
          sleep 0.5
          #LWINGYI && YURI#18
          printf "\r SCRIPT©BY LwinGyi&&"
          sleep 0.5
          #LWINGYI && YURI#19
          printf "\r SCRIPT©BY LwinGyi&&Y"
          sleep 0.5
          #LWINGYI && YURI#20
          printf "\r SCRIPT©BY LwinGyi&&Yu"
          sleep 0.5
          #LWINGYI && YURI#21
          printf "\r SCRIPT©BY LwinGyi&&YuR"
          sleep 0.5
          #LWINGYI && YURI#22
          printf "\r SCRIPT©BY LwinGyi&&YuRi"
          sleep 0.5
          #LWINGYI && YURI#23
          printf "\r SCRIPT©BY LwinGyi&&YuRi "
          sleep 0.5
          echo



#!/bin/bash

#Get the necessary components
apt-get update
apt-get install icewm tightvncserver dbus-x11 -y
apt-get install xfe -y
apt-get clean

#Setup the necessary files
mkdir ~/.vnc
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/WindowManager/Apt/IceWM/xstartup --no-check-certificate -P ~/.vnc/
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/WindowManager/Apt/IceWM/vncserver-start --no-check-certificate -P /usr/local/bin/
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/WindowManager/Apt/IceWM/vncserver-stop --no-check-certificate -P /usr/local/bin/

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

echo " "
echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with IceWM Window Manager"
echo " "
echo " "
echo " "
echo "Running vncserver-start"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncserver-stop"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncserver-start
