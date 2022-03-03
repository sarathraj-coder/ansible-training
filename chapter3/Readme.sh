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

# disable host key chewcking host_key_checking = False


# Destory vm from locally
# vagrant destroy