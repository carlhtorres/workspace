# HASHICORP REPO
if [ ! -f /etc/apt/sources.list.d/hashicorp.list ]; then
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi

# TERRAFORM
if ! terraform -v; then
    sudo apt update && sudo apt install terraform
fi

# VAGRANT
if ! vagrant -v; then
    sudo apt update && sudo apt install build-essential vagrant
    if [ -f ~/Downloads/VMware-Workstation-Full-* ]; then
        sudo bash $(ls ~/Downloads/VMware-Workstation-Full*.bundle | sort | head -n 1)
	sudo vmware-modconfig --console --install-all
	dpkg -i ~/Downloads/vagrant-vmware-utility_1.0.22-1_amd64.deb
	vagrant plugin install vagrant-vmware-desktop
    else
        echo "Download VMware Workstation"
    fi
fi
