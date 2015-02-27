# Golang-Vansible

A Vagrant box with Ansible provisioning for setting up a Vim-based Golang development environment.

## Prerequisites

- [Vagrant](https://www.vagrantup.com/)
- [Ansible](http://www.ansible.com/)
- [VirtualBox](https://www.virtualbox.org/)

### Installing the requirements in Ubuntu (tested with 14.04)

1. Install Virtualbox:<br>
	```bash
	sudo apt-get install virtualbox
	```
2. Install a recent version of ansible:<br>
   ```bash
   sudo apt-get install ansible/trusty-backports
   ```
   *(if you ubuntu version is "trusty", otherwise, replace it with your appropriate version)*
3. Install Vagrant, by first downloadng the proper .deb file from [vagrantup.com](https://www.vagrantup.com/downloads.html)
4. ... and then installing it with:<br>
	```bash
	sudo dpkg -i <deb-file>
	```

## Setup and Usage

#### Clone the github repository:

```bash
git clone git@github.com:samuell/golang-vansible
cd golang-vansible
```

#### Bring up the VM

```bash
vagrant up
```

#### Log in to the VM

```bash
vagrant ssh
```

### References

- [Vagrant & Ansible Quickstart Tutorial](http://adamcod.es/2014/09/23/vagrant-ansible-quickstart-tutorial.html)
- [Vagrant Virtual Machine Cluster](http://jessesnet.com/development-notes/2014/vagrant-virtual-machine-cluster)