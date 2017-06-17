template for monitoring IBM StorWize v3700 data storage through SSH

contains:
* 13 items
* 4 graphs
* 1 screen 
* 2 discovery rules

Items:
* CPU 
* temperature
* Power Consumtion
* FC (io, mb)
* Mdisk total (read/write , IO / latency )
* Volumes total (read / wrtite, IO / latency) 
* Each volume:
** status
** capacity
** real capacity
* Each DiskGroup (pool)
** status
** virual/free/real capacity

This templeate monitors storage system through SSH.


Installation:
* Ensure you have configured public keys for zabbix user
** https://www.zabbix.com/documentation/3.2/manual/config/items/itemtypes/ssh_checks
** create ssh-key for user named "zabbix"
** configure SSHKeyLocation in zabbix_server.conf
* create monitoring user on Storwize, allow public key authentication 
** create new user "zabbix" in Access->users menu in "monitor" group
** upload generated public key (id_rsa.pub)
* Import template
* Create host(s) for Storwize data storage system(s)
* Add template to hosts.