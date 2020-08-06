# Vagrant
* Website: https://www.vagrantup.com/
* Source: https://github.com/hashicorp/vagrant
* HashiCorp Discuss: https://discuss.hashicorp.com/c/vagrant/24

## Quick Start
To build the virtual environment and remote login with default vagrant credentials:
```
vagrant init ubuntu/bionic64
vagrant up
vagrant ssh
````
To shutdown the virtual envirnoment and deallocate used disk space:
```
vagrant destroy -f
```

To generate a ssh key associated with an email address when building the envirnoment simple pass Vagrant the EMAIL arguement. If not provided, no ssh key is generated. 
```
EMAIL="your-email@mail.com" vagrant up
```
