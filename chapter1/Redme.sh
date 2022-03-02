# ansible -i inventory testing -m ping -u node1 

#inventory mentioned in the ansibale.cfg
# sudo apt install sshpass is required
ansible testing -m ping -u node1  --ask-pass 

# Running a command in another server 
ansible testing -a "free -h" -u node1  --ask-pass 

ansible testing -a "date" -u node1  --ask-pass 

