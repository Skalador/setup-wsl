# Setup

Ansible Playbooks for setting up a DevOps focused workstation.

Used on:
- [WSL2](https://devblogs.microsoft.com/commandline/announcing-wsl-2/) with the [Ubuntu app](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6).

The current version of this playbook is tested with

```shell
cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.3 LTS"
```

This playbook and each role is tested regularly with [Molecule](https://ansible.readthedocs.io/projects/molecule/getting-started/#run-a-full-test-sequence).

## Setup WSL2

Follow the [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

## TL;DR

Run the following:

```bash
# Clone to your home directory
git clone https://github.com/Skalador/setup-wsl.git

# Installs ansible and dependencies
sudo ./bootstrap.sh

# Run the playbook
ansible-playbook -K playbook.yaml
```

## What do you get?

This playbook contains four roles. Each role focuses on a specific capability. To see the included packages follow the links below:
- [packages](https://github.com/Skalador/setup-wsl/blob/master/roles/packages/tasks/main.yaml)
- [shell](https://github.com/Skalador/setup-wsl/blob/master/roles/shell/tasks/main.yaml)
- [dev](https://github.com/Skalador/setup-wsl/blob/master/roles/dev/tasks/main.yaml)
- [ops](https://github.com/Skalador/setup-wsl/blob/master/roles/ops/tasks/main.yaml)

# Testing

Testing is done with [Molecule](https://ansible.readthedocs.io/projects/molecule/getting-started/#run-a-full-test-sequence). 

The entire playbook can be tested from the root of the repository with:
```bash
molecule test
```

Each role can be tested separately with
```bash
cd roles/<role_name>/
molecule test
```

The [tests](https://github.com/Skalador/setup-wsl/blob/master/molecule/default/molecule.yaml) rely on docker images from [Jeff Geerling](https://github.com/geerlingguy). Those images  ensure the docker container behaves like a usual VM (systemd,...).
