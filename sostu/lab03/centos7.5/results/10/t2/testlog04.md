```
# Results of running 04.sql
     1	set autotrace on;
     2	set timing on;
     3	-- TPC-H/TPC-R Pricing Summary Report Query (Q4)
     4	
     5	select
     6		o_orderpriority,
     7		count(*) as order_count
     8	from
     9		orders
    10	where
    11		o_orderdate >= date '1993-07-01'
    12		and o_orderdate < date '1993-07-01' + interval '3' month
    13		and exists (
    14			select
    15				*
    16			from
    17				lineitem
    18			where
    19				l_orderkey = o_orderkey
    20				and l_commitdate < l_receiptdate
    21		)
    22	group by
    23		o_orderpriority
    24	order by
    25		o_orderpriority;
    26	--where rownum <= -1;
>>> dbgen/queries/stub/04.sql

SQL*Plus: Release 19.0.0.0.0 - Production on Sun Jan 3 04:33:42 2021
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Last Successful login time: Sun Jan 03 2021 04:33:18 -05:00

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> SQL> SQL> SQL> SQL>   2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21  
O_ORDERPRIORITY ORDER_COUNT
--------------- -----------
1-URGENT	     105214
2-HIGH		     104821
3-MEDIUM	     105227
4-NOT SPECIFIED      105422
5-LOW		     105356

Elapsed: 00:00:17.47

Execution Plan
----------------------------------------------------------
Plan hash value: 168290725

----------------------------------------------------------------------------------------
| Id  | Operation	    | Name     | Rows  | Bytes |TempSpc| Cost (%CPU)| Time     |
----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT    |	       |     5 |   260 |       | 41270	 (1)| 00:00:02 |
|   1 |  SORT GROUP BY	    |	       |     5 |   260 |       | 41270	 (1)| 00:00:02 |
|*  2 |   HASH JOIN SEMI    |	       | 58004 |  2945K|  2384K| 41268	 (1)| 00:00:02 |
|*  3 |    TABLE ACCESS FULL| ORDERS   | 58004 |  1699K|       |  6620	 (1)| 00:00:01 |
|*  4 |    TABLE ACCESS FULL| LINEITEM |  3042K|    63M|       | 29625	 (1)| 00:00:02 |
----------------------------------------------------------------------------------------


Predicate Information (identified by operation id):
---------------------------------------------------

   2 - access("L_ORDERKEY"="O_ORDERKEY")
   3 - filter("O_ORDERDATE"<TO_DATE(' 1993-10-01 00:00:00', 'syyyy-mm-dd
	      hh24:mi:ss') AND "O_ORDERDATE">=TO_DATE(' 1993-07-01 00:00:00', 's
yyyy-mm-dd

	      hh24:mi:ss'))
   4 - filter("L_COMMITDATE"<"L_RECEIPTDATE")


Statistics
----------------------------------------------------------
	  1  recursive calls
	  0  db block gets
    1337328  consistent gets
	  0  physical reads
	  0  redo size
	806  bytes sent via SQL*Net to client
	703  bytes received via SQL*Net from client
	  2  SQL*Net roundtrips to/from client
	  1  sorts (memory)
	  0  sorts (disk)
	  5  rows processed

SQL> SQL> Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
# 04.sql:20210103043342:20210103043400:1609666423:1609666441:18 #
```
