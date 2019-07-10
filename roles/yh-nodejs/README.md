## yh-nodejs

NodeJS for RedHat/CentOS Debian/Ubuntu.

## Requirements

None

## Role Variables

> Default
```yaml
# ####################################
# User Config
# ####################################
end_user: "foobar"    # nodejs user
sub_cmd: "config"     # config
main_version: 8       # nodejs main version


# ####################################
# Install Config
# ####################################

# Install Dir Config
global_kits_home: "/usr/xhub"
software_install_home: "/home/linuxbrew"
software_stub_dir_path: "{{ software_install_home }}/stub"
software_opt_dir_path: "{{ software_install_home }}/opt"

# Resource Version Config
nodejs_ver: "8.16"
nodejs_version: "8.16.0"
nodejs_pkg_md5: "caabf1838fba99b1d228dfa66c38254f"
nodejs_pkg_name: "node-v{{ nodejs_version }}-linux-x64.tar.gz"
nodejs_install_dir_name: "node-v{{ nodejs_version }}-linux-x64"
nodejs_download_url: "https://npm.taobao.org/mirrors/node/v{{ nodejs_version }}/{{ nodejs_pkg_name }}"
nodejs_download_headers: {}
nodejs_local_pkg_path: "{{ software_stub_dir_path }}/{{ nodejs_pkg_name }}"
nodejs_install_home: "{{ software_opt_dir_path }}/{{ nodejs_install_dir_name }}"
nodejs_global_link_home: "{{ global_kits_home }}/nodejs-{{ nodejs_ver }}"


# ####################################
# Auto Computed Config
# ####################################
software_install_user: ""     # Green-Install-User
software_install_group: ""    # Green-Install-Group

```

> node 8.x config
```yaml
nodejs_ver: "8.16"
nodejs_version: "8.16.0"
nodejs_pkg_md5: "caabf1838fba99b1d228dfa66c38254f"
nodejs_pkg_name: "node-v{{ nodejs_version }}-linux-x64.tar.gz"
nodejs_install_dir_name: "node-v{{ nodejs_version }}-linux-x64"
nodejs_download_url: "https://npm.taobao.org/mirrors/node/v{{ nodejs_version }}/{{ nodejs_pkg_name }}"

nodejs_local_pkg_path: "{{ software_stub_dir_path }}/{{ nodejs_pkg_name }}"
nodejs_install_home: "{{ software_opt_dir_path }}/{{ nodejs_install_dir_name }}"
nodejs_global_link_home: "{{ global_kits_home }}/nodejs-{{ nodejs_ver }}"
```

> node 10.x config
```yaml
nodejs_ver: "10.16"
nodejs_version: "10.16.0"
nodejs_pkg_md5: "88a233b41b26c1603d38f8b18c793a87"
nodejs_pkg_name: "node-v{{ nodejs_version }}-linux-x64.tar.gz"
nodejs_install_dir_name: "node-v{{ nodejs_version }}-linux-x64"
nodejs_download_url: "https://npm.taobao.org/mirrors/node/v{{ nodejs_version }}/{{ nodejs_pkg_name }}"

nodejs_local_pkg_path: "{{ software_stub_dir_path }}/{{ nodejs_pkg_name }}"
nodejs_install_home: "{{ software_opt_dir_path }}/{{ nodejs_install_dir_name }}"
nodejs_global_link_home: "{{ global_kits_home }}/nodejs-{{ nodejs_ver }}"
```

> node 12.x config
```yaml
nodejs_ver: "12.6.0"
nodejs_version: "12.6.0"
nodejs_pkg_md5: "259326813ae277cf8a2cd764c610df8c"
nodejs_pkg_name: "node-v{{ nodejs_version }}-linux-x64.tar.gz"
nodejs_install_dir_name: "node-v{{ nodejs_version }}-linux-x64"
nodejs_download_url: "https://npm.taobao.org/mirrors/node/v{{ nodejs_version }}/{{ nodejs_pkg_name }}"

nodejs_local_pkg_path: "{{ software_stub_dir_path }}/{{ nodejs_pkg_name }}"
nodejs_install_home: "{{ software_opt_dir_path }}/{{ nodejs_install_dir_name }}"
nodejs_global_link_home: "{{ global_kits_home }}/nodejs-{{ nodejs_ver }}"
```

## Dependencies

- yh-brew: **linuxbrew** dir must be exist;

## Example Playbook
```yaml
- hosts: servers
  roles:
    - { role: yh-brew, brew_user: brew }
    - { role: yh-nodejs, end_user: xdc }
    - { role: yh-nodejs, end_user: test1 }

# Other Versions 10/12
- hosts: servers
  roles:
    - { role: yh-brew, brew_user: brew }
    - { role: yh-nodejs, main_version: 12, end_user: xdc }
    - { role: yh-nodejs, end_user: test1 }
```

## License

MIT / BSD

## Author Information
> One of Linux Fans.
