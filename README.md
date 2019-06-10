
## Install backup-script system-wide and also install dependencies (rclone and borgbackup) if needed
```sh
./backup-script install
```

## Install configuration system-wide and register systemd/launchd periodic jobs
```sh
backup-script install test-backup
./backup-script install ./test-backup
```

## Short summary of commands
```sh
# If configuration is installed system-wide
test-backup # perform-backup and then upload-offsite
test-backup uninstall
test-backup init
test-backup rclone-config
test-backup perform-backup
test-backup upload-offsite
test-backup start
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
backup-script use test-backup status
backup-script use test-backup log
backup-script use test-backup shell
```
