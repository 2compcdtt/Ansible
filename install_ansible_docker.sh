#!/bin/bash

# Обновление пакетов и установка необходимых зависимостей
echo "Обновление списка пакетов и установка зависимостей..."
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common python3-pip

# Добавление репозитория Docker GPG ключа и установка Docker
echo "Добавление Docker GPG ключа и репозитория..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Установка Docker
echo "Установка Docker..."
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Запуск и включение Docker
echo "Запуск Docker и включение его в автозагрузку..."
sudo systemctl start docker
sudo systemctl enable docker

# Установка Docker Compose
echo "Установка Docker Compose..."
sudo pip3 install docker-compose

# Проверка установки Docker и Docker Compose
echo "Проверка версии Docker и Docker Compose..."
docker --version
docker-compose --version

# Установка Ansible
echo "Установка Ansible..."
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Проверка установки Ansible
echo "Проверка версии Ansible..."
ansible --version

# Добавление текущего пользователя в группу Docker для работы без sudo
echo "Добавление пользователя в группу Docker..."
sudo usermod -aG docker $USER

# Вывод сообщения об успешной установке
echo "Ansible, Docker и Docker Compose успешно установлены!"

# Перезагрузка системы (требуется для применения изменений группы Docker)
echo "Перезагрузите систему, чтобы изменения вступили в силу, или выполните 'newgrp docker'"

