Vagrant.configure("2") do |config|
  servers=[
    {
      :hostname => "master",
      :box => "bento/ubuntu-18.04",
      :ip => "172.16.1.50",
      :ssh_port => '2200'
    },
    {
      :hostname => "dev",
      :box => "bento/ubuntu-18.04",
      :ip => "172.16.1.51",
      :ssh_port => '2201'
    },
    {
      :hostname => "integration",
      :box => "bento/ubuntu-18.04",
      :ip => "172.16.1.52",
      :ssh_port => '2202'
    },
    {
      :hostname => "preprod",
      :box => "bento/ubuntu-18.04",
      :ip => "172.16.1.53",
      :ssh_port => '2203'
    }
  ]

  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = machine[:box]
      node.vm.hostname = machine[:hostname]
      node.vm.network :private_network, ip: machine[:ip]
      node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"

      node.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 4096]
        vb.customize ["modifyvm", :id, "--cpus", 1]
      end
    end
  end
  # exec provision script on master (install jenkins)
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.provision "shell", path: "scripts/master.sh"
  end

  # exec provision script on dev (install maven)
  config.vm.define "dev" do |dev|
    dev.vm.hostname = "dev"
    dev.vm.provision "shell", path: "scripts/dev.sh"
  end
  # exec provision script on integration (install tomcat)
  config.vm.define "integration" do |integration|
    integration.vm.hostname = "integration"
    integration.vm.provision "shell", path: "scripts/integration.sh"
  end
  # exec provision script on preprod (install docker)
  config.vm.define "preprod" do |preprod|
    preprod.vm.hostname = "preprod"
    preprod.vm.provision "shell", path: "scripts/preprod.sh"
  end
end