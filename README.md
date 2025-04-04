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

## Getting a raspberrypi up and running

Get raspbian on the pi, manually add the ssh daemon and add the authorized keys for me

```
# On the raspberry pi
$ systemctl enable ssh
$ systemctl start ssh
$ mkdir ~/.ssh && chmod 750 ~/.ssh && curl -o ~/.ssh/authorized_keys https://github.com/jfharden.keys && chmod 640 ~/.ssh/authorized_keys
```

Then run the playbook to do the base config
```
# On the computer where you're running ansible set RPI_HOSTNAME to the hostname you want to configure the rpi as (or leave it off)
# Note this uses the default network hostname of raspberrypi
$ RPI_HOSTNAME=octoprint ansible-playbook -i raspbian --extra-vars "raspberrypi_hostname=$RPI_HOSTNAME" playbook-raspbian.yml
```

Now the base configuration is done you can run again to fully configure as the type of raspberry pi you want (in this example, octoprint)
```
ansible-playbook -u eviljonny -i octoprint playbook.yml
```

# License

Distributed under the MIT license (see LICENSE file)
