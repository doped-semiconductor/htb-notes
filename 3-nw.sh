ifconfig -a

netstat -tulnp4

netstat -tulp4

ip route get 10.129.162.185

ping -c 4 <target ip>

nmap <target IP>

nmap -p21,80 -sC -sV 10.129.162.185 # interest in ports 21,80

# anonymous ftp
#The reason we provided the [Ctrl + V] [Enter] [Enter] is because FTP requires a return character and new-line character (\r\n) for its commands. When we press Enter on our keyboard, Netcat only sends the \n.

#To determine the port number, we need to do some calculations. This is mainly due to limitations in the FTP protocol, as the full port cannot be displayed at once, so it is instead split to 2 small number 'p1 and p2; the last 2 numbers in the above output'. Then the real port is calculated as 'p1*256 + p2'.

nc 10.129.162.185 21

USER anonymous[Ctrl+V][Enter][Enter]
PASS anything[Ctrl+V][Enter][Enter]
PASV[Ctrl+V][Enter][Enter]

# last two passive numbers port = 'p1*256 + p2
# In New TErminal
nc -v 10.129.162.185 49675


#In Old Terminal
LIST[Ctrl+V][Enter][Enter]

#New Terminal should be populated w file name


#Old TErminal
PASV[Ctrl + V][Enter][Enter]

#Recalc port, open new conn and write on OLD TERM
RETR Note-From-IT.txt[Ctrl+V][Enter][Enter]

User-Agent: Server Administrator



nc -v <target ip> 80

GET / HTTP/1.1[enter]
Host: <target ip>[enter]
User-Agent: Server Administrator[enter][enter]