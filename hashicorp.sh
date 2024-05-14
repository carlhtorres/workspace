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
    sudo apt update && sudo apt install vagrant
fi