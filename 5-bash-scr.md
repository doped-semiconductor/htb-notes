
# Bourne Again Shell



## Script Execution - Examples

```bash
semiconductor@htb[/htb]$ bash script.sh <optional arguments>
semiconductor@htb[/htb]$ sh script.sh <optional arguments>
semiconductor@htb[/htb]$ ./script.sh <optional arguments>
```




## If


### Script.sh

```bash
#!/bin/bash

# Check for given argument
if [ $# -eq 0 ]
then
    echo -e "You need to specify the target domain.\n"
    echo -e "Usage:"
    echo -e "\t$0 <domain>"
    exit 1
else
    domain=$1
fi

```


## Arguments

```
Special Variable	Description
$#	                number of arguments passed to the script.
$@	                retrieve the list of command-line arguments.
$n	                Each command-line argument can be selectively retrieved using its position. For example, the first argument is found at $1.
$$	                process ID of the currently executing process.
$?	                exit status of the script. This variable is useful to determine a command's success. The value 0 represents successful execution, while 1 is a result of a failure.
```

## Declaring a Variable - Without an Error (No space)
```bash 
variable="Declared without an error."
echo $variable
```


## Arrays

> Arrays.sh
```bash
#!/bin/bash

domains=(www.inlanefreight.com ftp.inlanefreight.com vpn.inlanefreight.com www2.inlanefreight.com)

echo ${domains[0]}
```

> Res
```bash
semiconductor@htb[/htb]$ ./Arrays.sh

www.inlanefreight.com
```


### Quote

> Arrays.sh
```bash
#!/bin/bash

domains=("www.inlanefreight.com ftp.inlanefreight.com vpn.inlanefreight.com" www2.inlanefreight.com)
echo ${domains[0]}
```

> Res
```bash
semiconductor@htb[/htb]$ ./Arrays.sh

www.inlanefreight.com ftp.inlanefreight.com vpn.inlanefreight.com
```
# Operators

## String Operators

```bash
# Op	Description
# ==	is equal to
# !=	is not equal to
# <	    is less than in ASCII alphabetical order
# >	    is greater than in ASCII alphabetical order
# -z	if the string is empty (null)
# -n	if the string is not null



if [ "$1" != "HackTheBox" ]
then
    echo -e "You need to give 'HackTheBox' as argument."
    exit 1

elif [ $# -gt 1 ]
then
    echo -e "Too many arguments given."
    exit 1

else
    domain=$1
    echo -e "Success!"
fi
```

## Integer Operators

```bash
# Operator	Description
# -eq	is equal to
# -ne	is not equal to
# -lt	is less than
# -le	is less than or equal to
# -gt	is greater than
# -ge	is greater than or equal to



if [ $# -lt 1 ]
then
    echo -e "Number of given arguments is less than 1"
    exit 1

elif [ $# -gt 1 ]
then
    echo -e "Number of given arguments is greater than 1"
    exit 1

else
    domain=$1
    echo -e "Number of given arguments equals 1"
fi
```

## File Operators

```bash
# Operator	Description
# -e	if the file exist
# -f	tests if it is a file
# -d	tests if it is a directory
# -L	tests if it is if a symbolic link
# -N	checks if the file was modified after it was last read
# -O	if the current user owns the file
# -G	if the file’s group id matches the current user’s
# -s	tests if the file has a size greater than 0
# -r	tests if the file has read permission
# -w	tests if the file has write permission
# -x	tests if the file has execute permission

if [ -e "$1" ]
then
    echo -e "The file exists."
    exit 0

else
    echo -e "The file does not exist."
    exit 2
fi
```

## Boolean and Logical Operators
```bash
#!/bin/bash

# Check the boolean value
if [[ -z $1 ]]
then
    echo -e "Boolean value: True (is null)"
    exit 1

elif [[ $# > 1 ]]
then
    echo -e "Boolean value: True (is greater than)"
    exit 1

else
    domain=$1
    echo -e "Boolean value: False (is equal to)"
fi
```

## Logical Operators

```
Operator	Description
!	logical negotation NOT
&&	logical AND
||	logical OR
```
```bash
#!/bin/bash

# Check if the specified file exists and if we have read permissions
if [[ -e "$1" && -r "$1" ]]
then
    echo -e "We can read the file that has been specified."
    exit 0

elif [[ ! -e "$1" ]]
then
    echo -e "The specified file does not exist."
    exit 2

elif [[ -e "$1" && ! -r "$1" ]]
then
    echo -e "We don't have read permission for this file."
    exit 1

else
    echo -e "Error occured."
    exit 5
fi
```

# Arithmetic

## Arithmetic Operators
```
Operator	Description
+	Addition
-	Subtraction
*	Multiplication
/	Division
%	Modulus
variable++	Increase the value of the variable by 1
variable--	Decrease the value of the variable by 1
```


Arithmetic.sh
```bash
#!/bin/bash

increase=1
decrease=1

echo "Addition: 10 + 10 = $((10 + 10))"
echo "Subtraction: 10 - 10 = $((10 - 10))"
echo "Multiplication: 10 * 10 = $((10 * 10))"
echo "Division: 10 / 10 = $((10 / 10))"
echo "Modulus: 10 % 4 = $((10 % 4))"

((increase++))
echo "Increase Variable: $increase"

((decrease--))
echo "Decrease Variable: $decrease"
```

```bash
semiconductor@htb[/htb]$ ./Arithmetic.sh

Addition: 10 + 10 = 20
Subtraction: 10 - 10 = 0
Multiplication: 10 * 10 = 100
Division: 10 / 10 = 1
Modulus: 10 % 4 = 2
Increase Variable: 2
Decrease Variable: 0
```



VarLength.sh
``` bash
#!/bin/bash

htb="HackTheBox"

echo ${#htb}
```

``` bash
semiconductor@htb[/htb]$ ./VarLength.sh

10
```




# Input and Output
## Input Control


CIDR.sh
```bash
# Available options
<SNIP>
echo -e "Additional options available:"
echo -e "\t1) Identify the corresponding network range of target domain."
echo -e "\t2) Ping discovered hosts."
echo -e "\t3) All checks."
echo -e "\t*) Exit.\n"

read -p "Select your option: " opt

case $opt in
    "1") network_range ;;
    "2") ping_host ;;
    "3") network_range && ping_host ;;
    "*") exit 0 ;;
esac
```

## Output Control

CIDR.sh
``` bash
<SNIP>

# Identify Network range for the specified IP address(es)
function network_range {
    for ip in $ipaddr
    do
        netrange=$(whois $ip | grep "NetRange\|CIDR" | tee -a CIDR.txt)
        cidr=$(whois $ip | grep "CIDR" | awk '{print $2}')
        cidr_ips=$(prips $cidr)
        echo -e "\nNetRange for $ip:"
        echo -e "$netrange"
    done
}
```


### Identify IP address of the specified domain
`hosts=$(host $domain | grep "has address" | cut -d" " -f4 | tee discovered_hosts.txt)`

The "-a / --append" parameter ensures that the specified file is not overwritten but supplemented with the new results. At the same time, it shows us the results and how they will be found in the file.

```bash
semiconductor@htb[/htb]$ cat discovered_hosts.txt CIDR.txt

165.22.119.202
NetRange:       165.22.0.0 - 165.22.255.255
CIDR:           165.22.0.0/16
```







# Flow Control - Loops


## Syntax - Examples
```bash
for variable in 1 2 3 4
do
    echo $variable
done
```
```bash
for variable in file1 file2 file3
do
    echo $variable
done
```
```bash
for ip in 10.10.10.170 10.10.10.174 10.10.10.175
do
    ping -c 1 $ip
done
```

```bash
semiconductor@htb[/htb]$ for ip in 10.10.10.170 10.10.10.174;do ping -c 1 $ip;done

PING 10.10.10.170 (10.10.10.170): 56 data bytes
64 bytes from 10.10.10.170: icmp_seq=0 ttl=63 time=42.106 ms

--- 10.10.10.170 ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 42.106/42.106/42.106/0.000 ms
PING 10.10.10.174 (10.10.10.174): 56 data bytes
64 bytes from 10.10.10.174: icmp_seq=0 ttl=63 time=45.700 ms

--- 10.10.10.174 ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 45.700/45.700/45.700/0.000 ms
```

## CIDR.sh
```bash

# Identify Network range for the specified IP address(es)
function network_range {
    for ip in $ipaddr
    do
        netrange=$(whois $ip | grep "NetRange\|CIDR" | tee -a CIDR.txt)
        cidr=$(whois $ip | grep "CIDR" | awk '{print $2}')
        cidr_ips=$(prips $cidr)
        echo -e "\nNetRange for $ip:"
        echo -e "$netrange"
    done
}
```

## While Loops

CIDR.sh
``` bash
        stat=1
        while [ $stat -eq 1 ]
        do
            ping -c 2 $host > /dev/null 2>&1
            if [ $? -eq 0 ]
            then
                echo "$host is up."
                ((stat--))
                ((hosts_up++))
                ((hosts_total++))
            else
                echo "$host is down."
                ((stat--))
                ((hosts_total++))
            fi
        done
```

WhileBreaker.sh
``` bash
#!/bin/bash

counter=0

while [ $counter -lt 10 ]
do
  # Increase $counter by 1
  ((counter++))
  echo "Counter: $counter"

  if [ $counter == 2 ]
  then
    continue
  elif [ $counter == 4 ]
  then
    break
  fi
done
```

WhileBreaker.sh
```bash
semiconductor@htb[/htb]$ ./WhileBreaker.sh

Counter: 1
Counter: 2
Counter: 3
Counter: 4

```

## Until.sh
```bash
#!/bin/bash

counter=0

until [ $counter -eq 10 ]
do
  # Increase $counter by 1
  ((counter++))
  echo "Counter: $counter"
done
```

Until.sh
```bash
semiconductor@htb[/htb]$ ./Until.sh

Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
Counter: 6
Counter: 7
Counter: 8
Counter: 9
Counter: 10
```

## Exercise Script




