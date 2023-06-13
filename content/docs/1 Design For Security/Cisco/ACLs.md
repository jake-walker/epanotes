---
title: "ACLs"
---

Packet filtering controls access to a network by analysing the incoming and outgoing packets and passing or dropping based on criteria. Access control lists (ACLs) are made up of access control entries (ACEs).

ACLs can be configured 2 ways:

- Standard - _source address only_
- Extended - _source and destination addresses_

## Notes

- ACLs should be between an internal and external network (i.e. internet) or at a router positioned at a specific part of an internal network.
- Guidelines:
    - One ACL per protocol
    - One ACL per direction - inbound & outbound
    - One ACL per interface
    - Extended ACLs should be located as close as possible to the **source** of traffic to be filtered. Standard ACLs don't specify destination and therefore should be as close to the **destination** as possible.

## Configuration

<mark>The last ACL statement is **always** an implicit deny.</mark>

- **`access-list [id] [action] [ip address] [netmask]` - _Create standard ACL rule_**

    ID for standard rule is 1-99,1300-1999. Action is `permit`/`deny`/`remark`.

- **`access-list [id] [action] [proto] [src ip address] [src netmask] [dest ip address] [dest netmask] [op] [port]` - _Create extended ACL rule_**

    ID for extended rule is 100-199,2000-2699. Action is `permit`/`deny`/`remark`. Operation can be `eq` and maybe others?
    
    _Tip: for return traffic, use `access-list [id] permit tcp any any established`_

- **`ip access-list [type] [name]` - _Create named ACL_**

    Type can be `standard` or `extended`.

* **`interface [interface]`, `ip access-group [id] [direction]` - _Apply access list to interface_**

	Direction can be `in` for inbound packets (i.e. from interface to router), or `out` for outbound packets (i.e. from router to interface).