#!/bin/bash

# Mettre à jour les paquets
sudo apt update && sudo apt upgrade -y

# Installer Docker
echo "Installation de Docker..."
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

# Ajouter votre utilisateur au groupe Docker (pour éviter l'utilisation de sudo)
sudo usermod -aG docker $USER

# Installation de K3D
echo "Installation de K3D..."
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Installation de kubectl
echo "Installation de kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo "Installation terminée. Veuillez redémarrer votre terminal pour appliquer les changements."

