## yh-brew


Linuxbrew Installer

>
> **Test OK**
> - brew install **go**
> - brew install **python3**
> - brew install **redis**
>

## Requirements

None

## Role Variables

```yaml
# User Config
sub_cmd: config
brew_user: brew
end_user: '' # empty same as brew_user


# Advanced/Optional Config
brew_install_home: /home/linuxbrew/.linuxbrew

```

## Dependencies
```yaml
  - { role: yh-os-init }
```

## Example Playbook
```yaml

  # Install Linuxbrew and Configure env for 'brew_user' SELF
  - hosts: servers
    roles:
      - { role: yh-brew, brew_user: brew }

  # Install Linuxbrew and Configure env for 'end_user'
  - hosts: servers
    roles:
      - { role: yh-brew, brew_user: brew, end_user: test1 }
```

## License

MIT / BSD


## Author Information
> One of Linux Fans.
