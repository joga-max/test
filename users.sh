#! /bin/bash
arr=(marshal gerald ariana laurie)

for i in "${arr[@]}"
do
    if [ ! -d /home/"$i" ]; then
        password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
        sudo useradd -m -p $password "$i"
        echo $password > /home/"$i"/"$i".txt
        ssh-keygen -t rsa -f ~/.ssh/"$i" <<< y
        sudo deluser "$i"
    fi
done