# Vagrant to build vm locally 
# https://www.vagrantup.com/downloads
# brew install vagrant

# Create  a new centos vm quick - Vagarntfile
# https://app.vagrantup.com/boxes/search
# vagrant init centos/7
# vagrant up


# Adhoc commands 

   ansible multi -i inventory -a "hostname" 

# ansible play book 

   # ansible-playbook -i inventory playbook-01.yml -u sammy

   ansible-playbook   -i inventory playbook-01.yml
   ansible-playbook  playbook-01.yml --limit 192.168.60.4



# Destory vm from locally
# vagrant destroy