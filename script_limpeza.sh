#!/bin/bash

echo "Removendo VirtualBox e Vagrant..."

# -------------------------
# Parar serviços do VirtualBox
# -------------------------
echo "Parando serviços do VirtualBox..."
sudo systemctl stop vboxdrv 2>/dev/null
sudo systemctl stop vboxballoonctrl-service 2>/dev/null
sudo systemctl stop vboxautostart-service 2>/dev/null
sudo systemctl stop vboxweb-service 2>/dev/null

# -------------------------
# Remover VirtualBox
# -------------------------
echo "Removendo pacotes do VirtualBox..."
sudo apt purge -y virtualbox* 
sudo apt autoremove -y
sudo apt autoclean

# Remover possíveis versões instaladas manualmente
sudo rm -rf /opt/VirtualBox
sudo rm -rf /usr/lib/virtualbox

# Remover configurações do usuário
rm -rf ~/.config/VirtualBox
rm -rf ~/.VirtualBox

# -------------------------
# Remover Vagrant
# -------------------------
echo "Removendo Vagrant..."

sudo apt purge -y vagrant
sudo apt autoremove -y

# Caso tenha sido instalado via .deb manual
sudo rm -rf /opt/vagrant
sudo rm -f /usr/bin/vagrant

# Remover arquivos do usuário
rm -rf ~/.vagrant.d

# -------------------------
# Limpeza final
# -------------------------
echo "Limpando pacotes órfãos..."
sudo apt autoremove -y
sudo apt autoclean

echo "Remoção concluída!"