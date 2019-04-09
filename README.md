# Systemd service link switch POC
This repository serves as a POC for having a service that uses a symlink that the process will change at runtime and restart the service

## Details
- Each process runs for 5 seconds and inserts 5 logs in $main_dir/testswitch.service.log
- At the end of the process, the process will switch its link to the other version (v1 will link to v2 and v2 will link to v1)
- Then it will issue `systemctl service restart testswitch.service`

## Run

### Init
- Clone this repo
- cd to the repo
- run `sh init.sh`: this will create the service and link to v1

### Runtime
- You can start and stop the service by issuing `systemctl service start/stop/status testswitch.service`

### Demo
- When v1 is running, it will log "date v1" in $main_dir/testswitch.service.log
- When v2 is running, it will log "date v2" in $main_dir/testswitch.service.log
- Check the log to see which service is running