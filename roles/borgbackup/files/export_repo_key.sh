#!/bin/bash

set -euo pipefail

source ./borg_env.sh

borg key export :: /root/borgbackup/borg_repo_key-Backups-Smashbook
