#!/bin/sh

snmp_ipaddress=$1
snmp_comunity=$2
macaddress=$3

bridge_port=`snmpget -Ov -v1 -c $snmp_comunity $snmp_ipaddress 1.3.6.1.2.1.17.4.3.1.2.$macaddress 2>/dev/null`

if [ "$bridge_port" = "" ]; then
  echo Mac Address $macaddress not found;
  exit;
fi;

bridge_port=`echo $bridge_port | cut -d':' -f 2 | sed 's/^ //g'`
#echo $bridge_port

if_port=`snmpget -Ov -v1 -c $snmp_comunity $snmp_ipaddress .1.3.6.1.2.1.17.1.4.1.2.$bridge_port | cut -d' ' -f 2`
#echo $if_port

if_name=`snmpget -Ov -v1 -c $snmp_comunity $snmp_ipaddress .1.3.6.1.2.1.2.2.1.2.$if_port | cut -d '"' -f 2`
echo $if_name

if_descr=`snmpget -Ov -v1 -c $snmp_comunity $snmp_ipaddress 1.3.6.1.2.1.31.1.1.1.18.$if_port 2>/dev/null | cut -d":" -f 2`
echo $if_descr
