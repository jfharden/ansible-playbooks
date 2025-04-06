# Ansible Playbooks

My public ansible playbooks, mainly for configuring my personal computers and servers.

# Getting started

Ensure you have a nice modern python (you can user [asdf-vm]() and just do `asdf plugin add python; asdf install` in this directory) then run:

```
python -m venv .ansible-playbooks-venv
source .ansible-playbooks-venv/bin/activate
pip install -r requriements-python.txt
ansible-galaxy install -r requirements-ansible.yml
```

# Playbook usage

## Local linux laptop

Note: If doing this from a fresh install you will likely have to run the playbook twice, it will fail an assert if this
is required

```
ansible-playbook playbook.local.yml
```

## Raspberry Pi k8s cluster

```
ansible-playbook playbook.k8s.yml
```

# License

Distributed under the MIT license (see LICENSE file)
