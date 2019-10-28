unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vbguest plugin is not installed! Run - vagrant plugin install vagrant-vbguest'
end

Vagrant.configure(2) do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.99.201"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    # http://askubuntu.com/questions/238040/how-do-i-fix-name-service-for-vagrant-client
    # VBoxManage modifyvm [name] --natdnshostresolver1 on
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # vagrant plugin install vagrant-vbguest
  config.vm.define "centos7" do |centos7|
    centos7.vm.synced_folder "/Users", "/Users"
    centos7.vm.provision "shell", path: "scripts/init.sh"
  end

end
