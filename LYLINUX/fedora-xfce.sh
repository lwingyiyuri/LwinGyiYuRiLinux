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
          printf "\r Welcome  "
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome T  "
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To F"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fe"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fed"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedo"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedor"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedora"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedora L"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedora Li"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedora Lin"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedora Liu"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedora Linu"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r Welcome  To Fedora Linux"
          sleep 0.5
echo
          #LWINGYI && YURI#1
          printf "\r M"
          sleep 0.5
          #LWINGYI && YURI#2
          printf "\r My"
          sleep 0.5
          #LWINGYI && YURI#3
          printf "\r My H"
          sleep 0.5
          #LWINGYI && YURI#4
          printf "\r My He"
          sleep 0.5
          #LWINGYI && YURI#5
          printf "\r My Hea"
          sleep 0.5
          #LWINGYI && YURI#6
          printf "\r My Hear"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart F"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart Fo"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart For"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart For Y"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart For Yu"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart For YuR"
          sleep 0.5
          #LWINGYI && YURI#7
          printf "\r My Heart For YuRi"
          sleep 0.5
echo


#!/data/data/com.termux/files/usr/bin/bash
folder=fedora-fs
dlink="https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Fedora"
if [ -d "$folder" ]; then
	first=1
	echo "skipping downloading"
fi
tarball="fedora-rootfs.tar.xz"
if [ "$first" != 1 ];then
	echo "Download Rootfs, this may take a while base on your internet speed."
	arch=$(dpkg --print-architecture)
	if [ "$arch" == 'aarch64' ];
	then 
		wget --tries=20 https://github.com/AndronixApp/AndronixOrigin/raw/master/Rootfs/Fedora/arm64/fedora.partaa -O fedora.partaa
		wget --tries=20 https://github.com/AndronixApp/AndronixOrigin/raw/master/Rootfs/Fedora/arm64/fedora.partab -O fedora.partab
		cat fedora.parta* > fedora-rootfs.tar.xz
		rm -rf fedora.parta*
		cur=`pwd`
		mkdir -p "$folder"
		cd "$folder"
		echo "Decompressing Rootfs, please be patient."
		proot --link2symlink tar -xJf ${cur}/${tarball} --exclude='dev'||:
		cd "$cur"
		first=1
	fi
fi

if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo "Download Rootfs, this may take a while base on your internet speed."
		case `dpkg --print-architecture` in
		arm)
			archurl="armhf" ;;
		amd64)
			archurl="amd64" ;;
		x86_64)
			archurl="amd64" ;;	
		*)
			echo "unknown architecture"; exit 1 ;;
		esac
		wget "https://github.com/Techriz/AndronixOrigin/blob/master/Rootfs/Fedora/${archurl}/fedora-rootfs-${archurl}.tar.xz?raw=true" -O $tarball
  fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo "Decompressing Rootfs, please be patient."
	proot --link2symlink tar -xJf ${cur}/${tarball} --exclude='dev'||:
	
	echo "Setting up name server"
	echo "127.0.0.1 localhost" > etc/hosts
    echo "nameserver 8.8.8.8" > etc/resolv.conf
    echo "nameserver 8.8.4.4" >> etc/resolv.conf
	cd "$cur"
fi
mkdir -p fedora-binds
bin=start-fedora.sh
echo "writing launch script"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A fedora-binds)" ]; then
    for f in fedora-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b fedora-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "fixing shebang of $bin"
termux-fix-shebang $bin
echo "making $bin executable"
chmod +x $bin
echo "removing image for some space"
rm $tarball

#DE installation addition

wget --tries=20 $dlink/XFCE4/xfce4_de.sh -O $folder/root/xfce4_de.sh
clear
echo "Setting up the installation of XFCE VNC"
echo "#!/bin/bash
yum install wget -y
clear
if [ ! -f /root/xfce4_de.sh ]; then
    wget --tries=20 $dlink/XFCE4/xfce4_de.sh -O /root/xfce4_de.sh
    bash ~/xfce4_de.sh
else
    bash ~/xfce4_de.sh
fi
clear
if [ ! -f /usr/local/bin/vncserver-start ]; then
    wget --tries=20  $dlink/LXDE/vncserver-start -O /usr/local/bin/vncserver-start
    wget --tries=20 $dlink/LXDE/vncserver-stop -O /usr/local/bin/vncserver-stop
        chmod +x /usr/local/bin/vncserver-stop
    chmod +x /usr/local/bin/vncserver-start
fi
if [ ! -f /usr/bin/vncserver ]; then
    yum install tigervnc-server -y
fi
clear
echo 'Installing browser'
yum install firefox -y
rm -rf ~/.bash_profile" > $folder/root/.bash_profile 
rm -rf fedora-lxde.sh
bash $bin
