# tv2-sofie-ansible

Ansible playbooks for deploying Sofie Automation Systems. 


### Prerequisites

A ansible setup in place, with a control node and mananged nodes. For futher information about have a look at the [Ansible documentation](https://docs.ansible.com/ansible/latest/index.html). The playbooks have been developed for mananged nodes running Ubuntu server 20.04 LTS. The used Ansible version is 2.9.18.


### Clone:
```
git clone https://github.com/olzzon/tv2-sofie-ansible
```

### Edit the inventory file:
```
mkdir inventories/dev
touch inventories/dev/inventory.yml
vim inventories/dev/inventory.yml
```

Please have a look at the [example.inventory.yml](inventories/example.inventory.yml) to see the needed vars and host information. 

### Run Ansible:
```
ansible-playbook -i inventories/dev/inventory.yml setup_sofie.yml
``` 

Todo´s:
### Setup filebeat to log to kibana
* Indexes in kibana will need to be created manually to match those in elasticsearch
