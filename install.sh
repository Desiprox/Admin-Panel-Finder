#!/bin/bash
echo "[ ]====================================================================[ ]";
echo "[ ]                          Panel-Tracker                             [ ]";
echo "[ ]                          Install Script                            [ ]";
echo "[ ]====================================================================[ ]";
echo "";
echo "[!] Install.sh will install atscan tool in the system [Y/n]" ; 
read input1
if [ $input1 == "y" ] ; 
  then
    echo " "
  else
    exit
fi

echo "[!] Where Do you want to install the tool? [Ex:/usr/share/doc]:";
read refdir
echo "[!] Checking directories..."
if [ -d "$refdir/Panel-Tracker" ] ;
then
echo "[!] A directory panel-tracker was found! Do you want to replace it? [Y/n]:" ; 
read input2
if [ $input2 == "y" ] ; 
then
 rm -R "$refdir/Panel-Tracker"
else
 exit
fi
fi

 echo "[!] Installing ...";
 echo "";
 git clone https://github.com/Desiprox/Panel-Tracker.git;
 echo "#!/bin/bash 
 python $refdir/Panel-Tracker/ptracker.py" '${1+"$@"}' > ptracker;
 chmod +x ptracker;
 sudo cp atscan /usr/bin/;
 rm ptracker;


if [ -d "$refdir/Panel-Tracker" ] ;
then
echo "";
echo "Tool istalled with success!";
echo "";
  echo "[ ]====================================================================[ ]";
  echo "[ ]     All is done!! You can execute Atscan by typing atscan !        [ ]"; 
  echo "[ ]====================================================================[ ]";
  echo "";
else
  echo "[!] Installation faid!! ";
  exit
fi