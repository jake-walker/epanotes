---
title: "Database Normalisation"
---

* Data integrity is where data stored in a database can be trusted. It might fail, for example, if a customer can have 2 dates of birth assigned to them.
* Normalisation is a process to structure a table so it cannot express redundant information.
* Normalised tables are: easier to understand; easier to enhance and extend; and protected from insertion, update and deletion anomalies.
* Levels:
	* 1st Normal Form (1NF) - _minimum normalisation_
		* Using row order to convey information is not permitted (e.g. storing in people in age order, instead it should be stored in a separate column)
		* Mixing data types within the same column is not permitted (e.g. having both strings and numbers in a column (e.g. "two" and 2), this isn't allowed by the DBMS)
		* Having a table without a primary key is not permitted
		* Repeating groups are not permitted (e.g. comma separated list in one column)
	* 2nd Normal Form (2NF)
		* Each non-key attribute must depend on the entire primary key. _No part key dependencies._
	* 3rd Normal Form (3NF)
		* Every ~~non-key~~ attribute in a table should depend on the key, the whole key, and nothing but the key. _No transitive dependencies._
	* _4th Normal Form (4NF) - often not needed_
		* _Multivalued dependencies in a table must be multivalued dependencies on the key._
	* _5th Normal Form (5NF) - often not needed_
		* _The table (which must be in 4NF) cannot be describable as the logical result of joining some other tables together._
