# CUS 5.13.0 User I/O Before and After Release Deployment

## Context

On May 26, 2020 version 5.13.0 of the CUS platform was released into production. This platform operates a 
datahub for real-time data of the public transport in Switzerland.
It serves the customer information by various channels, e.g. the information screens
at railway stations or bus stops. One of the core components of this platform is the CUS database, an 
Oracle 11.2 database appliance (ODA).

Daily monitoring of the User I/O related database wait events seems to imply that the database user I/O has 
increased considerably since. 

The analysis' objective is to prove or disapprove this conjecture.


## The Data

The data was taken was taken from the dynamic performance view *DBA_HIST_SYSSTAT*. It is described in Oracles 
reference documentation, found online at https://docs.oracle.com/cd/E11882_01/server.112/e40402/stats.htm#REFRN103.
This view contains hourly snapshots, i.e. it samples every hour the statistic values.

For the analysis I chose the statistics 
* physical read total IO requests, and
* physical read total bytes

The statistics values are accumulated, and taken at the end time of the snapshot. This usually is at the full hour.
Due to high system load, taking the snapshot might be delayed, or is skipped altogether.

**N.B. 1** When the database is restarted, the statistics are reset to 0. If this happens, a statistics increment between a snapshot and its successor will be negative.
**N.B. 2** Due to the circumstances mentioned above, the duration of a snapshot interval might vary considerable. This has to be taken into account for the analysis.


### Query

````sql
alter session set nls_timestamp_format = 'YYYY-MM-DD HH24:MI:SS';

select begin_interval_time, end_interval_time, snap_id, instance_number,
  stat_name, value
from dba_hist_sysstat@kihubprod_link.sbb.ch
natural join dba_hist_snapshot@kihubprod_link.sbb.ch
order by begin_interval_time, instance_number, stat_name;
````

### Datafile Structure

* File name: dba-hist-sysstat.dsv
* Format: Text file, CSV
* Character set encoding scheme: UTF-8
* Field separator: ";" (semicolon)
* First line: field names
* 2n line and below: records
* Field 1: BEGIN_INTERVAL_TIME; timestamp YYYY-MM-DD HH24:MI:SS
* Field 2: END_INTERVAL_TIME; timestamp YYYY-MM-DD HH24:MI:SS
* Field 3: SNAP_ID; snapshot ID, non-negative integer
* Field 4: INSTANCE_NUMBER; ID of the database instance, non-negative integer
* Field 5: STAT_NAME; statistics’ name
* Field 6: VALUE; statistics’ value, integer