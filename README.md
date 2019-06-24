1. Checkout the repository

2. Install backup-script system-wide and install dependencies if needed (rclone and borgbackup):

```sh
./backup-script install
```

3. Write your backup configuration. You may use `test-backup` file as a reference.

4. Make an executable bundle from your configuration and backup-script, install it system-wide, and register systemd/launchd periodic jobs:

```sh
backup-script install test-backup # or ./path/to/test-backup
```

* You could also choose not to install backup-script system-wide and only install executable bundle of your config + said script. You may find it usefull if you are working back and forth on modifying backup-script content.

```sh
./backup-script install test-backup
```

5. Initialize the borg-backup repository:
```sh
test-backup init
```

* Your ``test-backup`` at that point is installed as a system-wide command, so you could run the command from any directory.

* If your RCLONE_REMOTE is not configured the interactive rclone configuration will start.

7. That's it! At that point once in an hour backup will be created and once a day it will be uploaded to your could store.

### Short summary of commands
```sh
# If configuration is installed system-wide
test-backup # perform-backup and then upload-offsite
test-backup uninstall
test-backup init
test-backup rclone-config
test-backup perform-backup
test-backup upload-offsite
test-backup start
test-backup stop
test-backup status
test-backup log
test-backup shell

# If configuration is not installed system-wide
backup-script use test-backup # perform-backup and then upload-offsite
backup-script use test-backup install
backup-script use test-backup uninstall
backup-script use test-backup init
backup-script use test-backup rclone-config
backup-script use test-backup perform-backup
backup-script use test-backup upload-offsite
backup-script use test-backup start
backup-script use test-backup stop
backup-script use test-backup status
backup-script use test-backup log
backup-script use test-backup shell
```
