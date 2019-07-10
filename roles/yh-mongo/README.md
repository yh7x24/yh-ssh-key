## yh-mongo

MongoDB for RedHat/CentOS Debian/Ubuntu.

## Requirements

None

## Role Variables

> Default
```yaml
# ####################################
# User Config
# ####################################
end_user: "foobar"    # mongo client user
sub_cmd: "config"     # config|add-svc|rm-svc
main_version: 4       # mongo main version


# ####################################
# Install Config
# ####################################

# Install Dir Config
global_kits_home: "/usr/xhub"
software_install_home: "/home/linuxbrew"
software_stub_dir_path: "{{ software_install_home }}/stub"
software_opt_dir_path: "{{ software_install_home }}/opt"

# Resource Version Config
mongo_ver: "4.0"
mongo_version: "4.0.10"
mongo_pkg_md5: "fa3aa08c5eecedee28ff7d6f7b483db0"
mongo_pkg_name: "mongodb-linux-x86_64-rhel70-{{ mongo_version }}.tgz"
mongo_install_dir_name: "mongodb-linux-x86_64-rhel70-{{ mongo_version }}"
mongo_download_url: "https://fastdl.mongodb.org/linux/{{ mongo_pkg_name }}"
mongo_download_headers: {}
mongo_local_pkg_path: "{{ software_stub_dir_path }}/{{ mongo_pkg_name }}"
mongo_install_home: "{{ software_opt_dir_path }}/{{ mongo_install_dir_name }}"
mongo_global_link_home: "{{ global_kits_home }}/mongo-{{ mongo_ver }}"


# ####################################
# Auto Computed Config
# ####################################
software_install_user: ""     # Green-Install-User
software_install_group: ""    # Green-Install-Group


# ####################################
# Data/Dataset Center Config
# ####################################
xdc_user: "xdc"           # Data Center (product env) User
xdc_prefix: "/home/xdc"   # Data Storage Root Path


# ####################################
# Daemon/Service Basic Config
# ####################################
mongod_port: 27017
mongod_unit_name: mongod-{{ mongod_port }}
mongod_unit_home: "{{ xdc_prefix }}/.xdc/{{ mongod_unit_name }}"

mongod_service_name: mongod # Display name in service list.
mongod_service_ctl_script: "{{ mongod_unit_home }}/mongod.sh"
mongod_service_conf_file: "{{ mongod_unit_home }}/mongod.conf"
mongod_service_pid_file: "{{ xdc_prefix }}/var/run/mongod.pid"
mongod_service_lock_file: "{{ xdc_prefix }}/var/run/mongod.lock"


# ####################################
# Daemon/Service mongo spec-config
# ####################################
mongod_conf_fork: true
mongod_conf_logappend: true
mongod_conf_directoryperdb: true
mongod_conf_auth: false   # enable auth or not
mongod_conf_rest: false

# master/slave mode 
mongod_conf_master: false

mongod_conf_slave: false
mongod_conf_master_source: ""

# replSet config
mongod_conf_replSet: false
mongod_conf_replSet_exec: false
mongod_conf_members: {}
```


## Dependencies

- yh-brew: **linuxbrew** dir must be exist;

## Example Playbook
```yaml
- hosts: servers
  roles:
    - { role: yh-brew, brew_user: brew }
    - { role: yh-mongo, xdc_user: xdc, end_user: brew }
    - { role: yh-mongo, xdc_user: xdc, end_user: test1 }

# Mult Dataset
- hosts: servers
  roles:
    - { role: yh-brew, brew_user: brew }
    - { role: yh-mongo, mongod_port: 27018, mongod_service_name: mongoXXd, xdc_user: xdc, end_user: test1 }
```

## License

MIT / BSD

## Author Information
> One of Linux Fans.
