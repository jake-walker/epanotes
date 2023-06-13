---
title: "Switching"
---

## Assign IP address

```
# USE 1 IF NOT USING VLANS, OTHERWISE USE MANAGEMENT VLAN
interface vlan X

# ASSIGN MANUALLY
ip address [ip addr] [netmask]

# ASSIGN VIA DHCP
ip address dhcp
```

## Security

```
switchport mode access
switchport port-security

# SET MAX NUM OF MAC ADDRESSES (DEFAULT 1)
switchport port-security max [value]

# SET VIOLATION MODE (RESTRICT/SHUTDOWN)
switchport port-security violation shutdown

# SET RATE LIMIT FOR BAD PACKETS
switchport port-security limit rate invalid-source-mac

# STICKY LEARNING OF MAC (TAKES MAC OF CONNECTED THING, CAN BE SAVED IN CONFIG FILE)
switchport port-security mac-address sticky

# REGULAR MAC ACCRESS
switchport port-security mac-address [mac-address]

show port-security address
show port-security interface [interface]
```

If using sticky addresses, the device connected needs to send packets out before the MAC is set on the switch (e.g. with a ping command). After this, if the config is saved the MAC address will persist after reboot.