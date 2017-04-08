# Backup

## Requirements

* Debian based system
* btrfs as filesystem

## Installation

```bash
sudo apt install btrfs-tools btrbk
sudo cp btrbk /etc/cron.dayly/btrbk
sudo chmod +x /etc/cron.dayly/btrbk
```

### Snapshots only local

```bash
sudo cp btrbk-local.conf /etc/btrbk/btrbk.conf
```

### Snapshots on external usb drive

```bash
sudo mkdir /mnt/backup
sudo mount /dev/sdb1 /mnt/backup/
sudo cp btrbk-extern.conf /etc/btrbk/btrbk.conf
```

```bash
cd /
sudo btrfs subvolume create srv
```

## Restore a Snapshot

```bash
btrbk list snapshots
mv /srv/data /srv/data.BROKEN
btrfs subvolume snapshot /srv/backup/data.20170101 /srv/data
```

## Restore a Backup

```bash
btrbk list backups
mv /srv/data /srv/data.BROKEN
btrfs send /mnt/backup/backup/srv.20170101 | btrfs receive /
btrfs subvolume snapshot /srv.20170101 /srv
btrfs subvolume delete /srv.20170101
```