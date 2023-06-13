---
title: "VLANs"
---

Works with layer 3 switches. Certain ports on a switch might be associated with different VLANs.

Switches 'tag' frames as they pass through VLAN trunking. Tags get removed as frames pass from trunking to end stations.

The [802.1q](https://geek-university.com/802-1q-overview/) protocol is used for implementing VLANs.

## Notes

- Untagged frames belong to the **native VLAN**.
- Cisco IP phones have their own VLAN ID to separate it from regular traffic.
- **Dynamic Trunk Protocol** allows a port to negotiate it's mode (access or trunk).

### Modes
By default, switches use <mark>dynamic auto</mark>.
|  | Dynamic Auto | Dynamic Desirable | Trunk | Access |
| --- | --- | --- | --- | --- |
| **Dynamic Auto** | Access | Trunk | Trunk | Access |
| **Dynamic Desirable** | Trunk | Trunk | Trunk | Access |
| **Trunk** | Trunk | Trunk | Trunk | --- |
| **Access** | Access | Access | --- | Access |

## Setup

**Switch:**

```
interface range fa0/5 - 10
switchport mode access

# SET A PORT TO TRUNK MODE AND SET NATIVE VLAN
interface fa0/1
switchport mode trunk
switchport trunk native vlan 99

# CREATE A VLAN
vlan 20
name Sales

# ASSIGN A RANGE OF PORTS TO A VLAN
interface range fa0/13 - 24
switchport mode access
switchport access vlan 20
# VOICE VLAN
switchport voice vlan 99

show vlan brief
delete vlan.dat
```

_To fix native VLAN mismatch, the native VLAN must be configured the same on each interface connected to a hub so that generated traffic is only redirected to one VLAN: `switchport trunk native vlan X`._

## Inter-VLAN Routing

**Router:**

```
interface fa0/0.10
encapsulation dot1q 10
ip address 192.168.10.1 255.255.255.0

interface fa0/0.20
encapsulation dot1q 20
ip address 192.168.20.254 255.255.255.0
```

Layer 3 switches can route packets between VLANs.
