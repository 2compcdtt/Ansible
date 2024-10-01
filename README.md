# Ansible
Убедимся, что у вас настроен файл инвентаря inventory.ini, указывающий на хост, где будет выполняться плейбук:
как пример 
[webservers]
192.168.1.10 ansible_user=username ansible_ssh_private_key_file=~/.ssh/id_rsa
и запуск плейбук
ansible-playbook -i inventory.ini playbook.yml
на всякий случий скрипт на установку ansible_docker.
install_ansible_docker.sh
для установки скрипта сделаем  файл исполняемым
использвая команду chmod +x install_ansible_docker.sh
запуск скрипта ./install_ansible_docker.sh
