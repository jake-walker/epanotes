---
title: "IPv6 Networking"
---

**Features:** Larger address space (128 bits vs 32 bits); elimination of public-private NAT; elimination of broadcast addresses; support for mobility and security; simplified header for improved router efficiency.

## Notes

- Link-local addresses (LLA) cannot cross routers, are only used within a LAN.
- Stateless auto-configuration (SLAAC) is a method for automatically assigning unique IPv6 LLAs.
- Shorthand - leading zeros can be left out; a pair of colons represent a bunch of zeros (can only be used once in the address).
- Subnet prefix is usually 64 bits, second part is an interface ID (or local identifier or token).
- Special addresses
  - `::/0` - All routes, used for default static route (equivalent to `0.0.0.0/0`).
  - `::/128` - Unspecified address, initially assigned to a host when it is resolving its LLA.
  - `::1/128` - Loopback address (equivalent to `127.0.0.1`).
  - `fe80::/10` - Link-local unicast address (similar to Windows auto-configuration address `169.254.*.*`).
  - `ff00::/8` - Multicast addresses.
  - All others - global unicast address.

## Subnetting

```
2001:df8:f2::6ee:0000:f11 =

           /23   /32   /48     /64
           ↓     ↓     ↓       ↓
2 0 0 1:0 d f 8:0 0 f 2:0 0 0 0:0 0 0 0:0 6 e e:0 0 0 0:0 f 1 1
\_________/ \___/ \___/ \_____/
 Registry    ISP   Site  Subnet
            Pref.  Pref. Prefix
\_____________________/ \_____/ \_____________________________/
 Global Routing Prefix  Subnet          Interface ID
                          ID
```
