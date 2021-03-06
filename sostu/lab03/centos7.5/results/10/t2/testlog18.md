```
# Results of running 18.sql
     1	set autotrace on;
     2	set timing on;
     3	-- TPC-H/TPC-R Pricing Summary Report Query (Q18)
     4	
     5	select
     6		c_name,
     7		c_custkey,
     8		o_orderkey,
     9		o_orderdate,
    10		o_totalprice,
    11		sum(l_quantity)
    12	from
    13		customer,
    14		orders,
    15		lineitem
    16	where
    17		o_orderkey in (
    18			select
    19				l_orderkey
    20			from
    21				lineitem
    22			group by
    23				l_orderkey having
    24					sum(l_quantity) > 300
    25		)
    26		and c_custkey = o_custkey
    27		and o_orderkey = l_orderkey
    28	group by
    29		c_name,
    30		c_custkey,
    31		o_orderkey,
    32		o_orderdate,
    33		o_totalprice
    34	order by
    35		o_totalprice desc,
    36		o_orderdate;
    37	--where rownum <= 100;
>>> dbgen/queries/stub/18.sql

SQL*Plus: Release 19.0.0.0.0 - Production on Sun Jan 3 04:38:02 2021
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Last Successful login time: Sun Jan 03 2021 04:37:46 -05:00

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> SQL> SQL> SQL> SQL>   2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23   24   25   26   27   28   29   30   31   32  
C_NAME			   C_CUSTKEY O_ORDERKEY O_ORDERDA O_TOTALPRICE
------------------------- ---------- ---------- --------- ------------
SUM(L_QUANTITY)
---------------
Customer#001287812	     1287812   42290181 26-NOV-97    558289.17
	    318

Customer#000644812	      644812	2745894 04-JUL-96    557664.53
	    304

Customer#001172513	     1172513   36667107 06-JUN-97    550142.18
	    322

...<snip>...

C_NAME			   C_CUSTKEY O_ORDERKEY O_ORDERDA O_TOTALPRICE
------------------------- ---------- ---------- --------- ------------
SUM(L_QUANTITY)
---------------
Customer#000248779	      248779   12563331 02-JUN-93    365315.83
	    301

Customer#000653965	      653965   27458500 25-SEP-95    364945.75
	    304

Customer#000750967	      750967   17612003 05-FEB-96    359071.37
	    302


624 rows selected.

Elapsed: 00:00:30.42

Execution Plan
----------------------------------------------------------
Plan hash value: 2591122236

---------------------------------------------------------------------------------------------
| Id  | Operation		| Name	   | Rows  | Bytes |TempSpc| Cost (%CPU) | Time     |
---------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT	|	   |   304K|	18M|	   | 86374   (1) | 00:00:04 |
|   1 |  SORT GROUP BY		|	   |   304K|	18M|	21M| 86374   (1) | 00:00:04 |
|*  2 |   HASH JOIN		|	   |   304K|	18M|  4912K| 81710   (1) | 00:00:04 |
|*  3 |    HASH JOIN		|	   | 75000 |  4028K|  3152K| 45892   (1) | 00:00:02 |
|*  4 |     HASH JOIN RIGHT SEMI|	   | 75000 |  2270K|	   | 44526   (1) | 00:00:02 |
|   5 |      VIEW		| VW_NSO_1 | 73952 |   433K|	   | 37904   (1) | 00:00:02 |
|*  6 |       HASH GROUP BY	|	   | 73952 |   649K|   114M| 37904   (1) | 00:00:02 |
|   7 |        TABLE ACCESS FULL| LINEITEM |  6001K|	51M|	   | 29591   (1) | 00:00:02 |
|   8 |      TABLE ACCESS FULL	| ORDERS   |  1500K|	35M|	   |  6618   (1) | 00:00:01 |
|   9 |     TABLE ACCESS FULL	| CUSTOMER |   150K|  3515K|	   |   956   (1) | 00:00:01 |
|  10 |    TABLE ACCESS FULL	| LINEITEM |  6001K|	51M|	   | 29591   (1) | 00:00:02 |
---------------------------------------------------------------------------------------------


Predicate Information (identified by operation id):
---------------------------------------------------

   2 - access("O_ORDERKEY"="L_ORDERKEY")
   3 - access("C_CUSTKEY"="O_CUSTKEY")
   4 - access("O_ORDERKEY"="L_ORDERKEY")
   6 - filter(SUM("L_QUANTITY")>300)


Statistics
----------------------------------------------------------
	 55  recursive calls
	  0  db block gets
    2467765  consistent gets
       4867  physical reads
	  0  redo size
      39750  bytes sent via SQL*Net to client
       1237  bytes received via SQL*Net from client
	 43  SQL*Net roundtrips to/from client
	  1  sorts (memory)
	  0  sorts (disk)
	624  rows processed

SQL> SQL> Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
# 18.sql:20210103043802:20210103043833:1609666683:1609666714:31 #
```
