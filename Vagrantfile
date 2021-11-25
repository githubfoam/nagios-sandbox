

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

  # vbox template for all vagrant instances
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
    vb.cpus = 2
  end
            #OK WORKING
             config.vm.define "vg-nagios-01" do |k8scluster|
                k8scluster.vm.box = "bento/centos-stream-8"
                k8scluster.vm.hostname = "vg-nagios-01"
                k8scluster.vm.network "private_network", ip: "192.168.50.15"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-nagios-01"
                    vb.memory = "1024"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap.sh"
                k8scluster.vm.provision :shell, path: "scripts/deploy-centos-stream-nagios.sh"
                # k8scluster.vm.provision :shell, path: "scripts/deploy-nagios-v1.sh"
              end

              #OK WORKING
              config.vm.define "vg-nagios-02" do |k8scluster|
                k8scluster.vm.box = "centos/stream8"
                k8scluster.vm.hostname = "vg-nagios-02"
                k8scluster.vm.network "private_network", ip: "192.168.50.16"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-nagios-02"
                    vb.memory = "1024"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap.sh"
                k8scluster.vm.provision :shell, path: "scripts/deploy-centos-stream-nagios.sh"
              end

              #OK WORKING
              config.vm.define "vg-nagios-03" do |k8scluster|
                k8scluster.vm.box = "centos/8"
                k8scluster.vm.hostname = "vg-nagios-03"
                k8scluster.vm.network "private_network", ip: "192.168.50.17"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-nagios-03"
                    vb.memory = "1024"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap.sh"
                k8scluster.vm.provision :shell, path: "scripts/deploy-centos-stream-nagios.sh"
              end
              
              #NOT WORKING
              config.vm.define "vg-nagios-04" do |k8scluster|
                k8scluster.vm.box = "bento/fedora-latest"
                k8scluster.vm.hostname = "vg-nagios-04"
                k8scluster.vm.network "private_network", ip: "192.168.50.18"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-nagios-04"
                    vb.memory = "1024"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap.sh"
                k8scluster.vm.provision :shell, path: "scripts/deploy-centos-stream-nagios.sh"
              end

end
