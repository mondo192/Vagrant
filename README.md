# Vagrant
* Website: https://www.vagrantup.com/
* Source: https://github.com/hashicorp/vagrant
* HashiCorp Discuss: https://discuss.hashicorp.com/c/vagrant/24

## Quick Start
To build the virtual environment and remote login with default vagrant credentials:
```
vagrant up
vagrant ssh
````
To shutdown the virtual envirnoment and deallocate used disk space:
```
vagrant destroy -f
```
## Creating an ssh key during build
To generate a ssh key associated with a token, simply pass Vagrant the TOKEN argument. If no arguement is provided, no ssh key is generated. 
```
TOKEN="your_token" vagrant up
```
To create a new token go to your profile > Settings > Developer settings > Personal access tokens > Generate new token
