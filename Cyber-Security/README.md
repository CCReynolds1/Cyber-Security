## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.


Images/ELK_Stack.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible file may be used to install only certain pieces of it, such as Filebeat.

  - ansible.cfg
  - hosts
  - DVWA_playbook.yml
  - elk-playbook.yml
  - filebeat-config.yml
  - filebeat-playbook.yml
  - metricbeat-config.yml
  - metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancing ensures that if one server goes down, the backup server will take the traffic.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the system logs and metrics.
- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them to either Elasicsearch or Logstash
- Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server

The configuration details of each machine may be found below.

|         NAME         |     Function     | Private IP Address |   Public IP  Address   | Docker Container |
|:--------------------:|:----------------:|:------------------:|:----------------------:|:----------------:|
| Jump-box-Provisioner |    Provisioner   |      10.0.0.4      |  20.65.13.83 (Dynamic) |      Ansible     |
|          Elk         | Log  Monitoring  |      10.1.0.4      | 20.83.246.246 (Static) |    ELK/Kibana    |
|         Web-1        |    Web Server    |      10.0.0.8      |  20.110.96.59 (Static) |       DVWA       |
|         Web-2        |    Web Server    |      10.0.0.9      |  20.110.96.59 (Static) |       DVWA       |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Home IP Address

Machines within the network can only be accessed by the ansible Docker Container running on the Jump Box using its IP address.

A summary of the access policies in place can be found in the table below.

|   NAME   |       Publicly Accessible      |                   Allowed IP Addresses                   |
|:--------:|:------------------------------:|:--------------------------------------------------------:|
| Jump Box |               No               |                    10.0.0.8 & 10.0.0.9                   |
|   Web-1  | Yes through the  Load Balancer |                       20.65.13.83                        |
|   web-2  |  Yes through the Load Balancer |                        20.65.13.83                       |
|    Elk   |               No               | SSH 20.65.13.83 - JumpBox only through your personal IP  |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- Install Docker.io
- Install Python3-pip
- Install pip docker module
- Increase virtual memory to 262144 and assure it increases uppon restart.
- Download and launch docker elk container sebp/elk:761 and enable on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/Elk.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 DVWA 10.0.0.8
- Web-2 DVWA 10.0.0.9

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects dadta from each of the Web servers such as ssh login attempts and geo location data.
- Metricbeat collects system info and resource info such as CPU usage, 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk_playbook.yml, elk_filebeat_playbook.yml, and elk_metricbeat file to /etc/ansible.
- Update the Hosts file to include the IP addresses of your web servers. Add another group labeled [ELK] and add the IP for the server below it.
- Run the DVWA-playbook, and navigate to http://20.83.246.246/setup.php (use your public ip) to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
The Playbook files are:
- elk-playbook.yml - used to install the Elk Server
    - filebeat-playbook.yml - used to install filebeat on the DVWA server and the Elk Server.
    - metricbeat-playbook.yml - used to install metricbeat on the DVWA server and the Elk Server.
Where do you copy them? 
/etc/ansible

Which file do you update to make Ansible run the playbook on a specific machine?

/etc/ansible/hosts.cfg

How do I specify which machine to install the ELK server on versus which to install Filebeat on?
 
in the Hosts configuration file, you tell it where you want each to be installed. 

Which URL do you navigate to in order to check that the ELK server is running?

http://publicipoftheelkserver:5601/setup.php
