# tv2-sofie-ansible
Ansible playbook for deploying Sofie Systems

This is in it´s initial state, and NOT working..

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
- Httpproxy for core to webhook slack?
- Core ntp servers?
- Nginx ssl?
