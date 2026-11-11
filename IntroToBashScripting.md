# Conditional Execution

### Question 1


> Create an "If-Else" condition in the "For"-Loop of the "Exercise Script" that prints you the number of characters of the 35th generated value of the variable "var".  the number as the answer.
Write your answer

```bash
#!/bin/bash

var="nef892na9s1p9asn2aJs71nIsm"

for counter in {1..40}
do
    if [ "$counter" -eq 35 ]; then
        printf '%s' "$var" | wc -m
    fi
    var=$(echo $var | base64)

    if [ "$counter" -eq 35 ]; then
        printf '%s' "$var" | wc -m
    fi
done
```


# Comparison Operators

### Question 1


Create an "If-Else" condition in the "For"-Loop that checks if the variable named "var" contains the contents of the variable named "value". Additionally, the variable "var" must contain more than 113,450 characters. If these conditions are met, the script must then print the last 20 characters of the variable "var".  these last 20 characters as the answer.

```bash
#!/bin/bash

var="8dm7KsjU28B7v621Jls"
value="ERmFRMVZ0U2paTlJYTkxDZz09Cg"

for i in {1..40}
do
    if [[ "$var" == *"$value"* ]] && (( ${#var} > 113450 )); then
        echo "${var: -20}"
    fi
    var=$(echo "$var" | base64)

    if [[ "$var" == *"$value"* ]] && (( ${#var} > 113450 )); then
        echo "${var: -20}"
    fi
done
```



# Flow Control - Loops

### Question 1


Create a "For" loop that encodes the variable "var" 28 times in "base64". The number of characters in the 28th hash is the value that must be assigned to the "salt" variable.
Write your answer

```bash
#!/bin/bash

# Decrypt function
function decrypt {
    MzSaas7k=$(echo $hash | sed 's/988sn1/83unasa/g')
    Mzns7293sk=$(echo $MzSaas7k | sed 's/4d298d/9999/g')
    MzSaas7k=$(echo $Mzns7293sk | sed 's/3i8dqos82/873h4d/g')
    Mzns7293sk=$(echo $MzSaas7k | sed 's/4n9Ls/20X/g')
    MzSaas7k=$(echo $Mzns7293sk | sed 's/912oijs01/i7gg/g')
    Mzns7293sk=$(echo $MzSaas7k | sed 's/k32jx0aa/n391s/g')
    MzSaas7k=$(echo $Mzns7293sk | sed 's/nI72n/YzF1/g')
    Mzns7293sk=$(echo $MzSaas7k | sed 's/82ns71n/2d49/g')
    MzSaas7k=$(echo $Mzns7293sk | sed 's/JGcms1a/zIm12/g')
    Mzns7293sk=$(echo $MzSaas7k | sed 's/MS9/4SIs/g')
    MzSaas7k=$(echo $Mzns7293sk | sed 's/Ymxj00Ims/Uso18/g')
    Mzns7293sk=$(echo $MzSaas7k | sed 's/sSi8Lm/Mit/g')
    MzSaas7k=$(echo $Mzns7293sk | sed 's/9su2n/43n92ka/g')
    Mzns7293sk=$(echo $MzSaas7k | sed 's/ggf3iunds/dn3i8/g')
    MzSaas7k=$(echo $Mzns7293sk | sed 's/uBz/TT0K/g')

    flag=$(echo $MzSaas7k | base64 -d | openssl enc -aes-128-cbc -a -d -salt -pass pass:$salt)
}

# Variables
var="9M"
salt=""
hash="VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K"

# Base64 Encoding Example:
#        user@htb$ echo "Some Text" | base64

for i in {1..28}
do
    var=$(echo "$var" | base64)
done

salt=${#var}

# Check if $salt is empty
if [[ ! -z "$salt" ]]
then
    decrypt
    echo $flag
else
    exit 1
fi
```



