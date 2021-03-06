# Imap Backup Docker

It's dockerized version of [imap-backup](https://github.com/joeyates/imap-backup) script. I run it's on my NAS for automate daily backup of several email accounts.

# Setup

You need to create config file in data folder. 

1) You can generate that by imap-backup script. To do this run setup script and follow instructions

```
$ docker run --rm -it -v $(PWD)/data:/root/.imap-backup/ --name "imap-backup" rpsl/imap-backup-docker:latest imap-backup setup
```

2) You can use example and you need manually create `config.json` file in `data` folder

```
{
  "accounts": [
    {
      "username": "my.user@gmail.com",
      "password": "secret",
      "local_path": "/path/to/backup/root",
      "folders":
        [
          {"name": "[Gmail]/All Mail"},
          {"name": "my_folder"}
        ]
    }
  ]
}
```

For additional options see [configuration-file](https://github.com/joeyates/imap-backup#configuration-file) in "imap-backup" documentation

# Usage
```
$ docker run --rm -d -e TZ="Europe/Moscow" -v $(PWD)/data:/root/.imap-backup/ --name "imap-backup" rpsl/imap-backup-docker:latest
```

# Images

## Docker hub
```
docker pull rpsl/imap-backup-docker:latest
```


## Build local

```
docker build -t "rpsl/imap-backup-docker" .
```

