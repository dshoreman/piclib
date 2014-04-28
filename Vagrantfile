# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.box = "precise32"
	config.vm.box_url = "http://files.vagrantup.com/precise32.box"

	config.vm.network :forwarded_port, guest: 80, host: 8080

	# Fix 'stdin: is not a tty' errors (https://github.com/mitchellh/vagrant/issues/1673)
	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

	config.vm.provision "shell", path: "vagrant/bootstrap.sh"

	# Fix DNS not working inside the VM
	config.vm.provider "virtualbox" do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
	end
end
