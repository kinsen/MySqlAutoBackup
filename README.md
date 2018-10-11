
# README

## 1. Update db_bak.sh

update username/password and database name

## 2. Config Service

> 1. Update dbbackup.service , change ExecStart to absolute the path
> 2. sudo cp dbbackup.service /etc/systemd/system/

## 3. Config Timer

> 1. sudo cp dbbackup.timer /etc/systemd/system/

## 4. Start Timer

```bash
sudo systemctl daemon-reload
sudo systemctl enable dbbackup.timer
sudo systemctl start dbbackup.timer
sudo systemctl status dbbackup.timer
sudo systemctl show dbbackup.timer
```

