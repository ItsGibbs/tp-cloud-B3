# init script for Vagrant VMs

# update OS
dnf update -y

# install ansible
dnf install -y ansible

# install python
dnf install -y python3

# create NOPASSWD user
sudo useradd -m toto
echo "toto ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/toto

#ssh-copy-id toto@10.1.1.


# chmod for ssh
mkdir /home/toto/.ssh
chmod 700 /home/toto/.ssh
touch /home/toto/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDBvwMUtBlwW03QRAZ6/twVfPJZWrr948aMUv6h7i75hoaM4heJ4bhhiKZ1LpFXckam9+YvVQi5pr2q/JlsJvx83hUps4J9qeORAXnkBeF2Zs+TQ0Ds6N9Sxb9DVLM1ew3WAom2+enzLPIvz9rU4acA2DCF7pfFRKiNgJFT1LBlNSMVorLAnSCnZk2x6uhB68R5W3Jo+5J6mUKrOULoxnv72vfg3Z6J5I3qLC+ZSfrOTr5u30bntDORDeU9FymSl1e+8gyRUNscZF3I7vzY9nCGUh88JK0YLnYu2h+Gx6CB87FMbTPcb4bnwUEPz+to05BsDF9Cp0D3D5+mLxiwhMbone7Imr37EoCchXaR8kOmIVDnd36a5bI3rhd9Gb2KzeT/d0VTQfyjcIUJCtxDxwtzo5bpyV9Pkzorr2FgWVKZz3kWG+bKP9cd0wBaH0BurD7lw59osDK7uh520DXi20GZm/LxDctaBVuFnGeEaSHSClWkoJVO9+5xkBduXYA1saSmy7NO4Czn0yyqdLj92gOMhNbzwG+IUxJPUgjBd0bsui37N0IWgvBdfyZPTYVVKnVjt/vsV4lU8s92la727y7qeRlbNnt+O0BxFtuaQvE/mWQzyxjrnfk7lUCZXpeMUVB+Z7Ho8sBdHhpez+OLltbFE8PIwh2akQw4kKGYalWFw== thepa@LAPTOP-FLEOPDHT" | sudo tee /home/toto/.ssh/authorized_keys
chmod 600 /home/toto/.ssh/authorized_keys
chown -R toto:toto /home/toto/.ssh

# désactive SELinux
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
