## yh-run-clean

Run pid/lock file clean for RedHat/CentOS Debian/Ubuntu.

Service Management using systemd/systemctrl.

## Requirements

None

## Role Variables
```yaml
# ####################################
# User Config
# ####################################
sub_cmd: "config"     # config|add-svc|rm-svc
xdc_user: "xdc"       # Data Center (product env) User


# ####################################
# Data/Dataset Center Config
# ####################################
xdc_prefix: "/home/{{ xdc_user }}"   # DC Storage Root Path
xdc_run_dir: "{{ xdc_prefix }}/var/run"


# ####################################
# Daemon/Service Basic Config
# ####################################
yhrc_service_name: "yh-run-clean"
yhrc_service_ctl_script: "{{ xdc_prefix }}/bin/{{ yhrc_service_name }}.sh"

```

## Dependencies

- yh-user: **xdc** user must be exist


## Example Playbook
```yaml
# reg service
# sub_cmd: config is same as add-svc [default]
- hosts: servers
  roles:
    - { role: yh-user, yh_user: xdc, yh_group: xdc, yh_uid: 5982, yh_gid: 5972 }
    - { role: yh-run-clean, xdc_user: xdc }

# remove service
- hosts: servers
  roles:
    - { role: yh-run-clean, sub_cmd: 'rm-svc', xdc_user: xdc }
```

## License

MIT / BSD

## Author Information
> One of Linux Fans.
