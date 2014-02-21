# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "win7-box"
  config.vm.network :forwarded_port, :host => 5515, :guest => 515
  config.vm.network :forwarded_port, :host => 9100, :guest => 9100

  # Important for using Windows guests (we switch to use WINRM instead of using SSH)
  # (see https://github.com/WinRb/vagrant-windows)
  config.vm.guest = :windows

  # Port forward WinRM and RDP
  #config.vm.network :forwarded_port, guest: 3389, host: 3389
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

  # Ensure that all networks are set to private (important for Windows 7 guests)
  config.windows.set_work_network = true

  config.vm.define :"win7-printing-sandbox" do |box|
    config.vm.provider :virtualbox do |vb|
      vb.gui = true
      vb.name = "win7-printing-sandbox"

      # Use VBoxManage to customize the VM. For example to change memory:
      vb.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "4"]
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["modifyvm", :id, "--vram", "32"]
    end
  end
end
