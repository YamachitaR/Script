#!/bin/bash

# Verificar o uso atual de Swap
echo "Uso atual de Swap:"
swapon --show
free -h

# Limpar cache de memória
echo "Limpando cache de memória..."
sudo sync; echo 1 > /proc/sys/vm/drop_caches

# Desabilitar o Swap
echo "Desabilitando o Swap..."
sudo swapoff -a

# Reabilitar o Swap
echo "Reabilitando o Swap..."
sudo swapon -a

# Verificar novamente o uso de Swap
echo "Uso de Swap após limpeza:"
swapon --show
free -h
