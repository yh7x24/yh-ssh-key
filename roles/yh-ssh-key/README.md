## yh-ssh-key

ssh-key gen+deploy for RedHat/CentOS Debian/Ubuntu.

## Requirements

None

## Role Variables
```yaml
# ####################################
# User Config
# ####################################
end_user: "foobar"
debug_mode: False
```

## Dependencies

None

## Example Playbook
```yaml
- hosts: servers
  roles:
    - { role: yh-ssh-key, end_user: brew }
```

## License

MIT / BSD

## Author Information
> One of Linux Fans.
