# ANSIBLE

## Overview
Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs.
### Feature of ansible:
    -    Automate remote system provisioning
    -    No Agent required
    -    Uses SSHd
    -    Parrel by default
    -    Simple code language
    


## Installation ubuntu 16.04

- Install python2.7 +

	`apt-get update`

	`apt-get install python`

- Install  pip

	`apt-get install python-pip`

- install ansible

	`pip install ansible`

- Validate installation

 `ansible —version`


## Ansible Inventory
 

### Overview

Ansible uses inventory file to manage server and server groups.
Inventory consist indivisual hostname or ip address or you can group severs by defining groups.

### Creating local inventory file
Default location of inventory file:
`/etc/ansible/hosts`

We can use custom inventory file with ansible.
Lets create one inventory file:

`mkdir -p /etc/ansible/`

`touch /etc/ansible/hosts`


### Add hosts and groups
`vim /etc/ansible/custom/hosts`

Now add your hosts addresses like this:

```
[web]

172.31.1.2
web.cldcvr.com

```

### Inventory config

- `ansible_connection`

Connect type can be  `local, ssh, docker`
	
- `ansible_ssh_host`
 
Define hostname for SSH host

- `ansible_ssh_port`

ssh port to connect, by default 22

- `ansible_ssh_user`

Define username for SSH

- `ansible_ssh_pass`

Specify SSH passwd for user

- `ansible_ssh_private_key_file`

Define key file to be used while SSH





### Using custom inventory file with ansible command

`ansible -i /etc/ansible/custom/hosts web  -m ping`
### Dynamic inventory

If you use Amazon Web Services EC2, maintaining an inventory file might not be the best approach, because hosts may come and go over time, be managed by external applications, or you might even be using AWS autoscaling. For this reason, you can use the EC2 external inventory script.

You can use this script in one of two ways. The easiest is to use Ansible’s -i command line option and specify the path to the script after marking it executable:

`ansible -i ec2.py -u ubuntu us-east-1d -m ping`

## Running AdHoc Commands

Simple modules:

- Ping

     `ansible  localhost  -m ping`
     `ansible web -m ping --private-key ~/Downloads/mini-conf.pem -u ubuntu`
	
- Apt Update
`ansible all -m raw -a "apt-get update" -u ubuntu --private-key ~/Downloads/mini-conf.pem -b`

- Install Python

`ansible all -m raw -a "apt-get install python -y" -u ubuntu --private-key ~/Downloads/mini-conf.pem -b`
- Disk usage

	`ansible all -a "df -h" -u ubuntu --private-key ~/Downloads/mini-conf.pem`

- Create user and setup password

 	`ansible all  -m user -a "name=test passwd=xyz"`

- Install packages

	`ansible all -m yum -a "name=nginx state=installed" -u root -b -k` 

- Restart service 

	`ansible all -m service -a "name=nginx state=restarted" -b -k `
- System Info

	`ansible localhost -m setup | less`





## PLAYBOOKS: A SIMPLE+POWERFUL AUTOMATION LANGUAGE

### Overview

Playbooks are Ansible’s configuration, deployment, and orchestration language. 

At a basic level, playbooks can be used to manage configurations of and deployments to remote machines. 

At a more advanced level, they can sequence multi-tier rollouts involving rolling updates, and can delegate actions to other hosts, interacting with monitoring servers and load balancers along the way.


### Syntax
Playbooks are expressed in YAML format (see YAML Syntax) and have a minimum of syntax, which intentionally tries to not be a programming language or script, but rather a model of a configuration or a process.

Each playbook is composed of one or more ‘plays’ in a list.

```
---
- hosts: webservers
  vars:
    http_port: 80
    max_clients: 200
  remote_user: root
  tasks:
  - name: ensure apache is at the latest version
    yum: name=httpd state=latest
  - name: write the apache config file
    template: src=/srv/httpd.j2 dest=/etc/httpd.conf
    notify:
    - restart apache
  - name: ensure apache is running (and enable it at boot)
    service: name=httpd state=started enabled=yes
  handlers:
    - name: restart apache
      service: name=httpd state=restarted
```



#### Basics
- Hosts and Users

For each play in a playbook, you get to choose which machines in your infrastructure to target and what remote user to complete the steps (called tasks).

- Tasks list

Each play contains a list of tasks. Tasks are executed in order, one at a time, against all machines matched by the host pattern, before moving on to the next task.

- Handlers: Running Operations On Change

Modules should be idempotent and can relay when they have made a change on the remote system. Playbooks recognize this and have a basic event system that can be used to respond to change

These ‘notify’ actions are triggered at the end of each block of tasks in a play, and will only be triggered once even if notified by multiple different tasks.

### Run a playbook

`ansible-playbook playbook.yml`


## Roles

Roles are ways of automatically loading certain vars_files, tasks, and handlers based on a known file structure.

Default location:`/etc/ansible/roles`

### Directory Structure

```
├── README.md
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── tasks
│   └── main.yml
├── templates
|.   |-- template.j2
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml
```
### Using roles

Example:

```
- name: Configure instance(s)
  hosts: localhost
  user: ubuntu
  become: True
  gather_facts: True
  roles:
    - { role: nginx, tags: ["nginx"] }
```


