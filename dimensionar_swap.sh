#!/bin/bash

# Tamanho do swap desejado (em GB)
SWAP_SIZE=4

# Menos de 2 GB de RAM: Swap deve ser pelo menos o dobro da quantidade de RAM.
# Entre 2 GB e 8 GB de RAM: Swap deve ser igual à quantidade de RAM.
# Mais de 8 GB de RAM: Swap deve ser metade da quantidade de RAM, mas pode variar dependendo das necessidades do sistema.


# Desativar swap atual
sudo swapoff -a

# Criar novo arquivo de swap
sudo dd if=/dev/zero of=/swapfile bs=1G count=$SWAP_SIZE

# Definir permissões
sudo chmod 600 /swapfile

# Configurar o arquivo como swap
sudo mkswap /swapfile

# Ativar o swap
sudo swapon /swapfile

# Tornar swap permanente
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Verificar swap
sudo swapon --show
