#!/bin/bash

set -euo pipefail

source ./borg_env.sh

borg init --encryption=repokey
