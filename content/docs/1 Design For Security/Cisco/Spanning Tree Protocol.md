---
title: "Spanning Tree Protocol"
---

Spanning Tree Protocol is on by default for switches, the below can be used for modifying the default configuration.

```
# SET ROOT BRIDGE
spanning-tree vlan 1 priority 0

# USE RAPID STP
spanning-tree mode rapid-pvst
```