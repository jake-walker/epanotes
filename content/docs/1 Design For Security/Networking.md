---
title: "Networking"
---

## Tips

- Cisco suggest routers use the highest IP addresses, and devices the lowest.
- When using variable length subnet masking (VLSM): identify the starting point; find the required subnets and order from largest to smallest; calculate the number of bits required for each subnet and how many host addresses are created; calculate subnets remembering to start at zero.

## Private Address Ranges

| Class | CIDR Block       | Range                             |
| :---: | ---------------- | --------------------------------- |
| A     | `10.0.0.0/8`     | `10.0.0.0` - `10.255.255.255`     |
| B     | `172.16.0.0/12`  | `172.16.0.0` - `172.31.255.255`   |
| C     | `192.168.0.0/16` | `192.168.0.0` - `192.168.255.255` |

## Subnetting Cheatsheet

| Wildcard     | 127 | 63  | 31  | 15  | 7   | 3   | 1   | 0   |
| ------------ | --- | --- | --- | --- | --- | --- | --- | --- |
| Subnet Count | 2   | 4   | 8   | 16  | 32  | 64  | 128 | 256 |
| Group Size   | 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| Mask         | 128 | 192 | 224 | 240 | 248 | 252 | 254 | 255 |
| CIDR 4       | /25 | /26 | /27 | /28 | /29 | /30 | /31 | /32 |
| CIDR 3       | /17 | /18 | /19 | /20 | /21 | /22 | /23 | /24 |
| CIDR 2       | /9  | /10 | /11 | /12 | /13 | /14 | /15 | /16 |
| CIDR 1       | /1  | /2  | /3  | /4  | /5  | /6  | /7  | /8  |
