# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS-6.5-x86_64-puppet"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # config.vm.network "public_network"

  config.vm.provider :vmware_fusion do |vmware|
    vmware.customize["memsize"] = $memsize
    vmware.customize["numcpus"] = $ncpus
  end

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--memory", $memsize]
    virtualbox.customize ["modifyvm", :id, "--cpus", $ncpus]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "default.pp"
    puppet.module_path = ["external_modules", "modules"]
    #puppet.hiera_config_path = "hiera.yaml"
    puppet.options = "--parser=future --verbose " + ENV['PUPPET_ARGS'].to_s
  end

end
