```
# Results of running 10.sql
     1	set autotrace on;
     2	set timing on;
     3	-- TPC-H/TPC-R Pricing Summary Report Query (Q10)
     4	
     5	select
     6		c_custkey,
     7		c_name,
     8		sum(l_extendedprice * (1 - l_discount)) as revenue,
     9		c_acctbal,
    10		n_name,
    11		c_address,
    12		c_phone,
    13		c_comment
    14	from
    15		customer,
    16		orders,
    17		lineitem,
    18		nation
    19	where
    20		c_custkey = o_custkey
    21		and l_orderkey = o_orderkey
    22		and o_orderdate >= date '1993-10-01'
    23		and o_orderdate < date '1993-10-01' + interval '3' month
    24		and l_returnflag = 'R'
    25		and c_nationkey = n_nationkey
    26	group by
    27		c_custkey,
    28		c_name,
    29		c_acctbal,
    30		c_phone,
    31		n_name,
    32		c_address,
    33		c_comment
    34	order by
    35		revenue desc;
    36	--where rownum <= 20;
>>> dbgen/queries/stub/10.sql

SQL*Plus: Release 19.0.0.0.0 - Production on Sun Jan 3 02:23:34 2021
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Last Successful login time: Sun Jan 03 2021 02:23:30 -05:00

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> SQL> SQL> SQL> SQL>   2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23   24   25   26   27   28   29   30   31  
 C_CUSTKEY C_NAME			REVENUE  C_ACCTBAL
---------- ------------------------- ---------- ----------
N_NAME			  C_ADDRESS
------------------------- ----------------------------------------
C_PHONE
---------------
C_COMMENT
--------------------------------------------------------------------------------
     57040 Customer#000057040	     734235.246     632.87
JAPAN			  Eioyzjf4pp
22-895-641-3466
sits. slyly regular requests sleep alongside of the regular inst


 C_CUSTKEY C_NAME			REVENUE  C_ACCTBAL
---------- ------------------------- ---------- ----------
N_NAME			  C_ADDRESS
------------------------- ----------------------------------------
C_PHONE
---------------
C_COMMENT
--------------------------------------------------------------------------------
    143347 Customer#000143347	     721002.695    2557.47
EGYPT			  1aReFYv,Kw4
14-742-935-3718
ggle carefully enticing requests. final deposits use bold, bold pinto beans. iro
nic, idle re

...<snip>...

 C_CUSTKEY C_NAME			REVENUE  C_ACCTBAL
---------- ------------------------- ---------- ----------
N_NAME			  C_ADDRESS
------------------------- ----------------------------------------
C_PHONE
---------------
C_COMMENT
--------------------------------------------------------------------------------
gular ideas. furiously silent attainments above the slyly si


37967 rows selected.

Elapsed: 00:00:04.67

Execution Plan
----------------------------------------------------------
Plan hash value: 3891426233

---------------------------------------------------------------------------------------------
| Id  | Operation		| Name	    | Rows  | Bytes |TempSpc| Cost (%CPU| Time     |
---------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT	|	    | 44738 |  8606K|	    | 39713  (1)| 00:00:02 |
|   1 |  SORT ORDER BY		|	    | 44738 |  8606K|  9192K| 39713  (1)| 00:00:02 |
|*  2 |   HASH JOIN		|	    | 44738 |  8606K|	    | 37790  (1)| 00:00:02 |
|   3 |    TABLE ACCESS FULL	| NATION    |	 25 |	725 |	    |	  3  (0)| 00:00:01 |
|*  4 |    HASH JOIN		|	    | 44738 |  7339K|	    | 37787  (1)| 00:00:02 |
|   5 |     VIEW		| VW_GBC_16 | 44738 |	786K|	    | 36830  (1)| 00:00:02 |
|   6 |      HASH GROUP BY	|	    | 44738 |  1572K|  4008K| 36830  (1)| 00:00:02 |
|*  7 |       HASH JOIN 	|	    | 84949 |  2986K|	    | 36269  (1)| 00:00:02 |
|*  8 |        TABLE ACCESS FULL| ORDERS    | 58004 |  1076K|	    |  6621  (1)| 00:00:01 |
|*  9 |        TABLE ACCESS FULL| LINEITEM  |  1478K|	 23M|	    | 29644  (1)| 00:00:02 |
|  10 |     TABLE ACCESS FULL	| CUSTOMER  |	150K|	 21M|	    |	957  (1)| 00:00:01 |
---------------------------------------------------------------------------------------------


Predicate Information (identified by operation id):
---------------------------------------------------

   2 - access("C_NATIONKEY"="N_NATIONKEY")
   4 - access("C_CUSTKEY"="ITEM_1")
   7 - access("L_ORDERKEY"="O_ORDERKEY")
   8 - filter("O_ORDERDATE"<TO_DATE(' 1994-01-01 00:00:00', 'syyyy-mm-dd
	      hh24:mi:ss') AND "O_ORDERDATE">=TO_DATE(' 1993-10-01 00:00:00', 's
yyyy-mm-dd

	      hh24:mi:ss'))
   9 - filter("L_RETURNFLAG"='R')

Note
-----
   - this is an adaptive plan


Statistics
----------------------------------------------------------
	 11  recursive calls
	  5  db block gets
     135918  consistent gets
	  0  physical reads
	876  redo size
    7264914  bytes sent via SQL*Net to client
      28705  bytes received via SQL*Net from client
       2533  SQL*Net roundtrips to/from client
	  1  sorts (memory)
	  0  sorts (disk)
      37967  rows processed

SQL> SQL> Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
# 10.sql:20210103022334:20210103022339:1609658615:1609658620:5 #
```
