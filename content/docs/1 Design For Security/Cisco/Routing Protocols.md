---
title: "Routing Protocols"
---

Protocols: RIP, IGRP, EIGRP, OSPF, IS-IS, BGP.

## OSPF

1. **`router ospf [process id]` - _Enable OSPF_**

    Process ID can be anything - used to setup multiple OSPF setups on the same router. Be consistent - use the same for the whole network for just one OSPF setup.

2. **`network [ip address] [wildcard address] area [area]` - _Advertise address over OSPF_**

    Run for each interface on the router. Wildcard address is the subnet mask inverted (e.g. `255.255.255.252` becomes `0.0.0.3`). Area number can be anything - use the same area number for the whole of the area.

3. **`show ip ospf neighbour` - _Show neighbours_**

    Use to check neighbours are properly advertised. This should show other routers you have setup OSPF on.

4. **`show ip route` - _Show routes_**

    Use to check OSPF routes are properly propagated across the network. Any routes starting with an `O` are received from OSPF - check they are being forwarded to the correct router(s).

## RIP

```
router rip
version 2
network [ip address]
no auto-summary

show ip rip database
```