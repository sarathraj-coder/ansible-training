# Vagrant to build vm locally 
# https://www.vagrantup.com/downloads
# brew install vagrant

# Create  a new centos vm quick - Vagarntfile
# https://app.vagrantup.com/boxes/search
# vagrant init centos/7
# vagrant up


# Adhoc commands 

   ansible multi -i inventory -a "hostname" 

    # -f 1  send result one by one instead of all 
    ansible multi -i inventory -a "hostname"  -f 1 
    ansible app  -i inventory -a "hostname"  -f 2
    ansible app  -i inventory -a "df -h"  -f 2
    ansible multi  -i inventory -a "free "  -f 2
     ansible multi  -i inventory -a "date "  -f 2

  # modules 
    # -m represents teh setup module 
    # we can use some of the paramets in the anisble cfg 
     ansible -i inventory db -m setup  # -m rep
     
  # install a package on the ystem     
  # -b is sudo 
  # -m is module  
     ansible -i inventory multi -b -m yum -a "name=ntp state=present"
     ansible -i inventory multi --become -m yum -a "name=ntp state=present"
    #   --ask-become-pass or -K 
          ansible -i inventory multi --ask-become-pass -m yum -a "name=ntp state=present"
     # cheking all ok     
            ansible -i inventory multi --become -m service -a "name=ntpd state=started enabled=yes"

     # stop the servive 
      ansible -i inventory multi --become -a "service ntpd  stop"

     # update ntp 

     ansible -i inventory multi --become -a "ntpdate -q 0.rhel.pool.ntp.org"  

     # limiting the server 
      ansible multi  -i inventory -a "free "  --limit 192.168.60.4
       # limiting the server using patterns  
      ansible multi  -i inventory -a "free "  --limit "*.4"

    # document 
    ansible-doc service

# disable host key chewcking host_key_checking = False

# creating user and group 

ansible app -b -m group -a "name=admin state=present"
ansible app -b -m user -a "name=sarath1 group=admin createhome=yes"
ansible app -b -m user -a "name=sarath1 group=admin createhome=yes password=12345"
ansible app -b -m user -a "name=sarath group=admin createhome=yes generate_ssh_key=yes"


#install generic package
ansible app -b -m package -a "name=git state=present"


# get tinformation ablout file 
ansible app -b -m stat -a "path=/etc/environment" 

# copy a file from server 
ansible app -b -m copy -a "src=/etc/hosts dest=/tmp/hosts"

# retrive a file from server  to current location
ansible app -b -m fetch -a "src=/etc/hosts dest=."
ansible app -b -m fetch -a "src=/etc/hosts dest=/tmp/"

# create a directory and files
ansible app -b -m file -a "dest=/tmp/test mode=644 state=directory"
ansible app -b -m file -a "dest=/tmp/test mode=644 state=absent"
ansible app -b -m file -a "src=/src/file dest=/tmp/test state=link"

# Running operations in background
#-B  maximum amout of time (seconds) let the job run
#-P maximum amount of polling time 

ansible multi -b -B 3600 -P 0 -a "yum -y update"

ansible multi -b -m async_status  -a "jid=618951302762.28809"

# checking log file

   # tail , grep cat etc 

   # tail -f wont work in ansible , 

   ansible multi -b -a "tail /var/log/messages "  
   ansible multi -b -m shell  -a "tail /var/log/messages | grep anisble-command | wc -l" 

# deploy application from git

ansible app -b -m git -a "repo=git://example.com/path/to.git dest=/opt/myapp update=yes version=1.2.4"

# run the application

  ansible app -b -a "/opt/myapp/update.sh"



# Destory vm from locally
# vagrant destroy