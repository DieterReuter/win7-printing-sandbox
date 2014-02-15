# win7-printing-sandbox

An instant Windows 7 VM for use as a printing sandbox.


# Installation
You'll need [Vagrant](http://vagrantup.com) and [VirtualBox](http://virtualbox.org) to install the Windows 7 sandbox. 

You should have a Windows 7 basebox ready and registered as "win7-box". 

To create the basebox, you could easily use my [basebox-packer](https://github.com/DieterReuter/basebox-packer) repo. 
Here you'll need to install [Packer](http://packer.io) first.

```bash
git clone https://github.com/DieterReuter/basebox-packer.git
cd basebox-packer
make virtualbox/dieter-win7x64sp1
```

Now register the basebox to your Vagrant environment:
```bash
vagrant box add win7-box virtualbox/dieter-win7x64sp1.box
```

(last build at 15.02.2014: run on a Windows 7 host with Packer 0.5.1, Vagrant 1.4.2, VirtualBox 4.3.6)


## How do use

To get started you only have to use `vagrant up`, and you're in the game.

```bash
git clone https://github.com/DieterReuter/win7-printing-sandbox.git
cd win7-printing-sandbox
vagrant up
```

Now you can use the fresh Windows 7 sandbox. Log in with the standard Vagrant user account, `username=vagrant` with `password=vagrant`.


# Licensing
Copyright (c) 2014 Dieter Reuter

MIT License, see LICENSE.txt for more details.