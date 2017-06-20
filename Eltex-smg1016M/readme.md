template for monitoring Eltex SMG1016M ip-ats gate

contains:
* 15 items
* 1 discovery rules (E1 channels)

Items:
* CPU 
* temperature
* Fan Speed
* Power Unit Status
* Each E1 channel:
** status
** Link state
** Phy state
** Rx Count
** Tx Count
** Free Channels


### Installation

* configure SNMP on eltex gateway
* import template
* create host for Eltex-SMG1016M ats-gateway
* add template to host