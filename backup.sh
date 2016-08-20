#!/bin/bash
rsync -aruv --exclude-from '/etc/backup_excludes.txt' /home/klucas/ /media/FreeAgentDisk/klucas/ &
rsync -aruv --exclude-from '/etc/backup_excludes.txt' /home/klucas/ /media/backup/klucas/ &
rsync -aruv /home/emjosephs/labNotes/ /media/FreeAgentDisk/emjosephs/labNotes/ &
rsync -aruv /home/emjosephs/labNotes/ /media/backup/emjosephs/labNotes/ &
rsync -aruv --exclude 'default' /media/myth/ /media/media_backup &

#duplicity /media/myth/ /media/media_backup
#rsync -aruv --exclude 'default' /media/myth/ /media/old_myth &
