SNMP MAC-Address - interface table template


Collects mac addresses - interface-name table from switches
* Make it possible to find mac-address over switch ports
* stores mac-address migration history


Scans oids:
* .1.3.6.1.2.1.17.4.3.1.2 - list mac addresses known by switch, determines BRIDGE port index
* .1.3.6.1.2.1.17.1.4.1.2 - IF-MIB -- BRIDGE-MIB interface indexes correlation
* .1.3.6.1.2.1.2.2.1.2 (IF-MIB::ifDescr) - interface human readable name


### Requires

* snmpget utility (snmp package)
* {$SNMP_COMMUNITY} user macro

### Instalation

* copy script snmp_macaddr_name.sh to externalscripts directory
* import template
* add template to switch's host-record

Note1:
* some switches use independend mac-addres tables for each VLAN. In theese cases VLAN number should be placed in community string.
** for example: "public" for default VLAN, "public@120" for VLAN_ID = 120, "public@10" for VLAN_ID = 10
** you can check this behaviour by command "snmpwalk -v1 -c public@111 192.168.0.1 .1.3.6.1.2.1.17.4.3.1.2"  (where public - community string, 111 - vlan_id used in switch, 192.168.0.1 - ip address of switch)
* additional steps should be implemented for such switches, for each VLAN used in network:
** clone LLD rule
** change "SNMP community" value to {$SNMP_COMMUNITY}@<VLAN_ID>, where <VLAN_ID> - ID of vlan in discovery rule
** change "SNMP community" value in item prototype "MacAddress_{#MACRECORD}_Port_name" in the same way.

Note2:
* it is possible to use this template without external scirpt in simple way on some switches (most on cisco SMB)
** theese switches has equal port indexes in BRIDGE-MIB and If-MIB.
** so you can disable first extenalcheck-type item_prototype (MacAddress_{#MACRECORD}_Port_name) and enable seccond one SNMPv2-type

### How to find MAC address

* go to Monitoring -> Latest Data 
* type "Mac-Address-Table" into "application" field
* type mac address (or part) into "Name" field (Mac address must be space-delimited, example: "00 11 22 33")
* You will get list of switch-port pairs when mac address was learned


### See also

* http://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/44800-mactoport44800.html
* https://habrahabr.ru/post/319404/
* https://habrahabr.ru/post/128439/
* https://habrahabr.ru/post/271867/
* https://habrahabr.ru/post/213247/