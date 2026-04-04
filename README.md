# BashrcMalware
A linux malware that exploits .bashrc file on linux!

# DISCLAIMER
I take no responsibility for your actions, as I posted it on github for education purposes or certified and authorized penetration testing

## How to use

To use this malware to get a reverse TCP on your target you need to modify the line 3:

    vi malware.sh
    
And change the ip adress var typing your IP adress (if you want you can also change the port)

(You need to do the same thing with the .cpp file, and then compile it)

Then you need to start netcat:

    sudo nc -nlvp 4444

If you have not changed the port you must put 4444 (the default port) while if you have changed the port you must put the port number you wrote in the file

Then, send the malware (renaming it) with a good social engineering and good luck

If you want to execute another command you can also modify the command var in line 5

# Its undetectable

![Hehe](https://github.com/MikeTheHash/BashrcMalware/blob/main/JustFlex.png)
![Hehe2](https://github.com/MikeTheHash/BashrcMalware/blob/main/undetectable-proof.png)

# Happy Hacking!
