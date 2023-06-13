---
title: "Splunk"
---

* See available data at Settings → Data → Indexes.
* Source types can be found in root of search section.
* Use interesting fields (along the left sidebar) for narrowing queries & finding stats.

| Search Flag | Example | Description |
| --- | --- | --- |
| `index="..."` | `index="main"` | Select data from a given index. |
| `key="value"` | `Hostname="pc1"` | Filter results for a specific value. |
| `key="value" AND key="value"` | `Hostname="pc1" AND EventID="1234"` | Filter with logical AND/OR/NOT/XOR. |
| `sourcetype="..."` | Filter by log type. |
| `source="..."` | Filter by specific source/file. |

Filters are applied with a `|` (e.g. `bucket _time span=day`)

| Filter | Description |
| --- | --- |
| `bucket _time span=day` | Group events into discreet buckets of information (e.g. by time). |
| `stats count by _time` | Get statistics over a given time (e.g. `count`). |
| `table a, b, c` | Create a table for the list of fields. |
| `rename a as b` | Rename a field. |
| `sort b` | Sort by a field. |
| `reverse` | Reverse the order. |
| `dedup b` | Get just one of each field (unique). |
| `top limit=5 a` | Get the first 5 values for a field. |

