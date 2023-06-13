---
title: "NAT"
---

NAT changes the IP address in the header when crossing a router. Local IPs are inside the network, global IPs are outside.

## Dynamic NAT Configuration

1. Define a pool of global addresses to be used for translation.

    `ip nat pool [name] [start-ip] [end-ip] {netmask [netmask]} {prefix-length [prefix-length]}`

2. Configure a standard access list permitting the addresses that should be translated.

    `access-list [id] permit [...]`

3. Establish dynamic source translation, specifying the access list and pool defined in prior steps.

    `ip nat inside source list [id] pool [name]`

4. Identify the inside interface.

    `interface [...]`, `ip nat inside`

5. Identify the outside interface.

    `interface [...]`, `ip nat outside`
