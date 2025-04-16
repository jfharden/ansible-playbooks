#!/bin/bash

export BORG_RSH='ssh -i /home/eviljonny/.ssh/hetzner_storage_box_ecc'
HETZNER_USERNAME=$(</root/borgbackup/hetzner_username)
BORG_PASSPHRASE=$(</root/borgbackup/passphrase)
export BORG_PASSPHRASE
export BORG_REMOTE_PATH=borg-1.1

# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO="ssh://${HETZNER_USERNAME}@${HETZNER_USERNAME}.your-storagebox.de:23/./Backups/Smashbook"
