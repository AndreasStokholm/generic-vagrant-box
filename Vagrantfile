host_port		= '1337'
project_name	= 'Project Name'
vbox_memory		= '256' # Megabytes

Vagrant.configure("2") do |config|
	config.vm.box = 'ubuntu/trusty64'

	config.vm.network "forwarded_port", guest: 80, host: host_port

	config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"

	config.vm.provider "virtualbox" do |v|
		v.customize [
			"modifyvm", :id,
			"--memory", vbox_memory,
			"--name", project_name
		]
	end

	config.vm.provision "shell" do |s|
		s.path = "provision/setup.sh"
	end
end