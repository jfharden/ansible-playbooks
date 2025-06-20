#!/bin/bash

set -euo pipefail

echo "Subject: Completed BorgBackup at $(date)
MIME-Version: 1.0
Content-Type: text/html

<div>
<pre style='font-family: \"Lucida Console\", \"Courier New\", monospace'>
Server Backup with Borg Backup

$(/usr/games/cowsay -f sheep "Borg Backup complete, resistance was futile!")
</pre>
</div>
" | /usr/sbin/sendmail jfharden+borgbackupstatus@gmail.com

