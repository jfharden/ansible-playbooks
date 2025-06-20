#!/bin/bash

source ./borg_env.sh

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                                  \
    --stats                                  \
    --show-rc                                \
    --compression lz4                        \
    --exclude-caches                         \
    --exclude 'mnt/MEDIA_VOL_1/Unorganised/' \
                                             \
    ::'{hostname}-{now}'                     \
    /mnt/MEDIA_VOL_1/                        \
    /mnt/k8s-array/

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 12 monthly
# archives of THIS machine. The '{hostname}-*' matching is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --glob-archives '{hostname}-*'  \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  12

prune_exit=$?

### While we are stuck with borg 1.1 there is no compact
### # actually free repo disk space by compacting segments
### 
### info "Compacting repository"
### 
### borg compact
### 
### compact_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))
### global_exit=$(( compact_exit > global_exit ? compact_exit : global_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup, Prune, and Compact finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup, Prune, and/or Compact finished with warnings"
else
    info "Backup, Prune, and/or Compact finished with errors"
fi

exit ${global_exit}

