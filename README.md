
# README

## 1. Update db_bak.sh

update username/password and database name

## 2. Config Service

> 1. Update dbbackup.service , change ExecStart to absolute the path
> 2. sudo mv dbbackup.service /usr/lib/systemd/system

## 3. Config Timer

> 1. sudo mv dbbackup.timer /usr/lib/systemd/system

## 4. Start Timer

```bash
sudo systemctl start dbbackup.timer
```

