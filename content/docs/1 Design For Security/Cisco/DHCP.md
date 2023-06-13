---
title: "DHCP"
---

```
ip dhcp pool [name]
network [net-addr] [net-mask]
default-router [router-ip]
dns-server [dns-ip/router-ip]

# (OPTIONAL) EXCLUDE ADDRESSES FROM ASSIGNMENT
ip dhcp excluded-address [ip-addr]

# ENABLE SERVICE
service dhcp
```