---
title: "EtherChannel"
---

EtherChannel creates load balancing between multiple ports, but is logically seen as 1 link.

The bandwidth of all links are used (up to 8 ports). Ports must have the same speed, duplex and VLAN.

```
interface range g0/1 - 2
channel-group 1 mode active

show etherchannel summary
```

## Modes

| Mode | Protocol | Description |
| --- | --- | --- |
| Auto | PAgP | Interface responds to PAgP negotiation, but will not start negotiations. |
| Desirable | PAgP | Interface actively attempts PAgP negotiation. |
| On | EtherChannel | Forces connection without a protocol to negotiate connections. Can only connect to another device set to on. No PAgP or LACP is used. |
| Active | LACP | Interface actively attempts LACP negotiation. |
| Passive | LACP | Interface responds to LACP negotiation, but will not start negotiations. |

