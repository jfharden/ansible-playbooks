#!/bin/bash

set -euo pipefail

echo "Subject: Failed BorgBackup at $(date)
MIME-Version: 1.0
Content-Type: text/html

<div>
<pre style='font-family: \"Lucida Console\", \"Courier New\", monospace'>
Failed to backup with Borg Backup

$(/usr/games/cowsay -f flaming-sheep "Oh noes! Everything is burning, backup failed!!!")
</pre>
</div>
" | sendmail jfharden+borgbackupstatus@gmail.com

