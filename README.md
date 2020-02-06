# tv2-sofie-ansible
Ansible playbook for deploying Sofie Systems

### Install ansible:
on ubuntu:
```
sudo apt install ansible
```

### Clone:
```
git clone https://github.com/olzzon/tv2-sofie-ansible
```

### Edit the inventory file:
```
cp hosts.example hosts
nano hosts
```

### Run Ansible:
```
ansible-playbook playbook.yml -i hosts
``` 


Todo´s:
### Setup filebeat to log to kibana
* Indexes in kibana will need to be created manually to match those in elasticsearch

### Setup blueprints deployment:
```
cd scripts
git clone https://github.com/olzzon/tv2-sofie-blueprints-inews.git
cd tv2-sofie-blueprints-inews
yarn
```
Deploy the blueprints from the deployment scriptmenu. (later in this README.md)

## Future steps:
