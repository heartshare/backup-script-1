1. Checkout the repository or your clone of that repository

2. Initial step is to install backup-script system-wide and to install dependencies (rclone and borgbackup) if needed. To do that please run the command:

```sh
./backup-script install
```

3. Write your backup configuration using test-backup file as a reference

4. Next step is to install backup configuration system-wide and register systemd/launchd periodic jobs. To do that run the command:

```sh
backup-script install test-backup # or ./path/to/test-backup
```

You could also choose not to install backup-script system-wide and only install backup configuration. You may find it usefull if you are working back and forth on modifying backup-script content.

```sh
./backup-script install ./test-backup
```

5. Now the repository needs to be initialized. For that run the command:

```sh
test-backup init
```
Your ``test-backup`` at that point is installed as a system-wide command, so you could run the command from any directory.

That's it!

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
