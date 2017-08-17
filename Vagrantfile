require 'json'

settings = File.open('settings.json', 'r') { |json| JSON.parse(json.read) }

Vagrant.configure("2") do |config|
    config.vm.box = 'ubuntu/' << settings['ubuntu']
    config.vm.network :private_network, ip: settings['ip']
    config.vm.synced_folder "./synced", "/home/vagrant"

    config.vm.provider "virtualbox" do |virtualbox|
      virtualbox.name   = settings['name']
      virtualbox.memory = settings['memory']
      virtualbox.cpus   = settings['cpus']
    end
    
    settings['scripts'].each do |script|
        config.vm.provision :shell, path: script['path'], run: script['run']
    end
  end
  