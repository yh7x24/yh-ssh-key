## yh-user

User for RedHat/CentOS Debian/Ubuntu.

## Requirements

None

## Role Variables

```yaml
# ####################################
# User Config
# ####################################
yh_user: "era"
yh_group: "era"
yh_uid: 1582
yh_gid: 1582
var_hub: "/var"
var_dir_prefix: "" # e.g. "home-", "user-"
var_dir_suffix: ".u" # e.g. ".u", ".v", ".d"

can_sudo: false


# ####################################
# Advanced/Optional Config
# ####################################
yh_home: "/home/{{ yh_user }}"
global_sudoers_ext_file: "/etc/sudoers.d/99-yh-{{ yh_user }}"

# Level 1 Sub Dirs
yh_bin_path: "{{ yh_home }}/bin"         # 可执行文件
yh_etc_path: "{{ yh_home }}/etc"         # 配置目录
yh_log_path: "{{ yh_home }}/log"         # 日志目录
yh_opt_path: "{{ yh_home }}/opt"         # 绿色安装、解压安装存放处
yh_data_path: "{{ yh_home }}/data"       # 净数据目录
yh_stub_path: "{{ yh_home }}/stub"       # 原始安装包、压缩包、tar包
yh_backup_path: "{{ yh_home }}/backup"   # 备份目录，文件建议以 xxx-年月日.tar.bz2 归档
yh_var_path: "{{ yh_home }}/var"         # 运行时：可变数据目录
yh_run_path: "{{ yh_var_path }}/run"     # 运行时: pid等
yh_runtime_path: "{{ yh_var_path }}/lib" # 运行时: 临时、缓冲文件等

# Runtime Dateset Dirs
var_log_hub: "{{ var_hub }}/log/{{ var_dir_prefix }}{{ yh_user }}{{ var_dir_suffix }}"
var_run_hub: "{{ var_hub }}/run"
var_lib_hub: "{{ var_hub }}/lib/{{ var_dir_prefix }}{{ yh_user }}{{ var_dir_suffix }}"

```

## Dependencies

None

## Example Playbook
```yaml
- hosts: servers
  roles:
    # Normal / Test User
    - { role: yh-user, yh_user: test1, yh_group: test1, yh_uid: 1582, yh_gid: 1582 }
    # Sudo User
    - { role: yh-user, yh_user: brew, yh_group: brew, yh_uid: 1752, yh_gid: 1752, can_sudo: true }
    # Sudo User + xdc
    - { role: yh-user, yh_user: xdc, yh_group: xdc, yh_uid: 5972, yh_gid: 5972, can_sudo: true }
```

## License

MIT / BSD

## Author Information
> One of Linux Fans.
