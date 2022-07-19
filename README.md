# Quiz of Operating Systems Course
Lab Quiz of Operating Systems Course
<br>
- University of Łódz
- (5 July 2022)
- Teacher referance: <a href="https://www.math.uni.lodz.pl/~jakubo/">Jakub Olejnik</a>


<br><b>Tasks</b><br>
```
Write a script that:
* creates a file containing the word MYFILE, with the name being your login name in MYDIR subdirectory of your home,
	hint: whoami, $USER
* sets the filemode of MYDIR so that you and the group owner are the only ones not to read its contents
* additionally sets the filemode of MYDIR so that only the owner of an entry can delete it
* creates a file NEWFILE in your home
* creates a hardlink to MYFILE in MYDIR
* makes a copy of MYDIR named MYDIRCOPY
* makes sure that puts as many lines to NEWFILE as the first digit of your uid
* makes a copy of MYDIR in MYDIRCOPY subdirectory of your home
* copies all regular files containing two question marks in their name from /etc/ to DOTDOT subdirectory of your home
* displays the number of all users not using csh as their default shell
* creates file named my baby's love - lyrics.txt that is a symlink to /bin located in C:\\WINDOWS subdirectory of your home
* displays an arbitrary warning if a regular file with name containig a four letter word begining with l and ending with e can be found in your home directory and any of its subdirectories 
```

<br><b>Script File</b><br>
```bash
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

```
