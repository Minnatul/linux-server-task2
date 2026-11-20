# Linux Server Task (Ubuntu 24.04)

I did this task on an Ubuntu Server 24.04 VM running in VMware Workstation.

## SSH
- Created a new user `task2` and gave it sudo access.
- Made an SSH key on my PC with `ssh-keygen -t ed25519` and copied the public key to the server.
- Checked that key login worked before changing anything.
- Set `PermitRootLogin no` and `PasswordAuthentication no` in `/etc/ssh/sshd_config`.
- Found that `/etc/ssh/sshd_config.d/50-cloud-init.conf` still had `PasswordAuthentication yes` and was overriding my setting, so I changed that too.
- Confirmed with `sudo sshd -T`, and tried a password login and a root login. Both were rejected.

## Nginx
- Installed Nginx and made two simple sites:
  - Site 1 on port 8081 (`/var/www/site1`)
  - Site 2 on port 8082 (`/var/www/site2`)
- Configs are in `nginx/` and the pages are in `html/`.
- Ran `sudo nginx -t` to test the config, then reloaded Nginx.
- Ran `sudo systemctl enable nginx`, rebooted the VM, and Nginx came back up on its own.

## Script
`scripts/sysinfo.sh` prints the hostname, date, disk usage, memory usage and uptime, and appends the result to `~/sysinfo.log`.
