## A script to initialize borgbackup and rclone and run them as periodic services

This script aims to ease the installation of borgbackup and rclone. The idea is to make backups each hour and upload them to cloud storage each day.

You could run this on Linux or on macOS.

This script use your backup configuration to bundle it into the executable file to provide you with the handy commands and register systemd/launchd jobs to run it each hour.

If you wish to fine-tune the borgbackup, rclone or systemd/launchd services I suggest you to clone that repository and make changes to [backup-script](backup-script) file.

### How to install/use it

1. Checkout the repository

2. Run the following command to install backup-script system-wide and install dependencies if needed (rclone and borgbackup):

```sh
./backup-script install
```

3. Write your backup configuration. You could use [test-backup](test-backup) file as a reference.

4. Run the following command to make an executable bundle from your configuration and backup-script, install it system-wide, and register systemd/launchd periodic jobs:

```sh
backup-script install test-backup # or ./path/to/test-backup
```

* You could also choose not to install backup-script system-wide and only install executable bundle of your config + said script. You may find it usefull if you are working back and forth on modifying backup-script content.

```sh
./backup-script install test-backup
```

5. Run the following command to initialize the borg-backup repository:
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

### LED blinking

If you happens to use that script on your Raspberry Pi you may wish to blink LED to signal that services are working well. Use [led-heartbeat.service](led-heartbeat.service) and [led-heartbeat.sh](led-heartbeat.sh) as a reference to do that.
