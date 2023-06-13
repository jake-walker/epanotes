---
title: "Cisco IOS Overview"
---

<mark><kbd>CTRL + SHIFT + 6</kbd> cancels the current command.</mark>

## Basics

- `enable` - Enable privileged exec mode.
- `configure terminal` - Global configuration mode.
- `hostname [hostname]` - Change device name.
- `banner motd #` - Set the MOTD message.
- `interface [interface]` - Configure a given interface (e.g. editing attributes or IP address).
- **`copy running-config startup-config` - Save configuration!**
- `show running-config` - Show the current configuration for everything.
- `show interfaces` / `show ip interface brief` - Show interface configuration information.

## Security

- `enable secret [password]` - Enable a password for entering privileged exec mode.
- `line [...]`, `password [password]`, `login` - Enable password authentication for a given connection (e.g. console, over network).
	- `line con 0` - Physical console port
	- `line vty 0 4` - Telnet/SSH access
- `service password-encryption` - Enable password encryption
- **Router ports are shutdown by default**, switch ports are not shutdown by default.

## Routing

Manual routing is prone to error and becomes admin overhead, use [Routing Protocols]({{< ref "docs/1 Design For Security/Cisco/Routing Protocols" >}}) where possible.

- `ip route [dest network] [dest netmask] [next router]` - Create a static route to another network.