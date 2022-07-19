#!/bin/bash


mkdir ~/MYDIR
touch MYDIR/"$USER"
echo MYFILE >> ~/MYDIR/"$USER"


chmod u-r,g-r ~/MYDIR
chmod +t ~/MYDIR

touch ~/NEWFILE
ln -v ~/MYDIR ~/NEWFILE
cp -R ~/MYDIR ~/MYDIRCOPY


for (( i=1; i<=${UID:0:1}; i++ )); do 
   echo "line\n" >> ~/NEWFILE
done


cp -R ~/MYDIR ~/MYDIR/MYDIRCOPY 

mkdir ~/DOTDOT; find /etc/ -maxdepth 1 -type f | grep "*\?*\?*" | xargs -I {} cp {} ~/DOTDOT/

cut -d: -f7 /etc/passwd | grep -v "csh" | wc -l >> ~/MYDIR/MYFILE


mkdir -p ~/C:\\WINDOWS
ln -s ~/bin ~/C:\\WINDOWS/"my baby's love - lyrics".txt


if [ "$(find ~/ -type f -name "*l??e*" | head -n 1)" ]; then
        echo "WARNING"
fi
