<div style="width:1200px;">

# About the Data

## Data Source

The data was taken from the Oracle (11.2.0.4) _performance view_ SYS.DBA_HIST_SYSSTAT.
This view contains several hundert historicized system statistics, i.e. snapshots of the
real time system statistic. The snapshots are taken at the end of every full hour; however
this might vary due to system restart, or when the database is under stress.

The view SYS.DBA_HIST_SYSSTAT is described in the Oracle Database Reference document, to be
found online at http://docs.oracle.com/cd/E11882_01/server.112/e40402/toc.htm.
The statistics themselves are described in the same document, section E _Statistics Descriptions_,
at https://docs.oracle.com/cd/E11882_01/server.112/e40402/stats.htm#REFRN103.

**N.B.** : Oracle system statistics are running sums. Upon every restart of a database instance,
the statistics are reset to zero.


## Context

The databases examined are the production and integration databases of the SBB CUS platform.
This platform operates a datahub for real-time data of the public transport in Switzerland.
It serves the customer information by various channels, e.g. the information screens
at railway stations or bus stops.

Each database runs on its own platform, an Oracle Database Appliance (ODA). And each database
consists of two instances which run in cluster mode (Oracle Real Application Cluster RAC).
After an upgrade in spring 2019 of the grid infrastructure of the integration platform, this
database suffered from serious performance problems. The performance issues mostly manifested
themselves as significantly increased waits (by number and duration) of the _Cluster_ wait class,
i.e. of wait events which are related to the cluster setup of the databases.

In beginning of August a number of patches were applied to the database,in order to re-establish
its previous performance. The analysis' goal is to show if this is the case or not. For this
purpose an number of selected system statistics of the integration and production databases
are compared. The analysis consists of the follwing steps:

1. Test if the loads of integration and production databases are similar.
2. Test if the cluster-related waits of the two databases are similar.


## Measurements

**Preconditions**
1. The two databases have the database version Oracle RDBMS EE 11.2.0.4 for ODA.
2. The two databases have the same application version 5.11.1 1.(180.1).
3. None of the integration and production database instances was restarted in the period to
   be analysed.

The last precondition is not really mandatory, but makes the analysis more straightforward.

The data is selected from the Performanceview by executiong the SQL statement below on the
two databases. The beginning of the interval &ndash; August 22 2019, 00:00 CEST &ndash; is due
to the retention period limited to 7 days on the integration database; and the end of the interval
&ndash; August 29 2019, 08:00 CEST &ndash; is due to the installation of a new application
release on the intergration environment.

````sql
alter session set nls_timestamp_format = 'YYYY-MM-DD HH24:MI:SS';

select begin_interval_time, end_interval_time, snap_id, instance_number,
  stat_name, value
from dba_hist_sysstat
natural join dba_hist_snapshot
where begin_interval_time between timestamp '2019-08-22 00:00:00'
  and timestamp '2019-08-29 08:00:00'
order by begin_interval_time, instance_number, stat_name;
````

## Datafiles

The selected data have been exported to the **';'**-delimited files dba_hist_sysstat.inte.dsv
for the integration database, and dba_hist_sysstat.prod.dsv for the production database.

### Datafile Structure

* Format: Text file
* Field separator: “;” (semicolon)
* First line: field names
* 2nd line and below: records
* Field 1: BEGIN_INTERVAL_TIME; timestamp YYYY-MM-DD HH24:MI:SS
* Field 2: END_INTERVAL_TIME; timestamp YYYY-MM-DD HH24:MI:SS
* Field 3: SNAP_ID; snapshot ID, non-negative integer
* Field 4: INSTANCE_NUMBER; ID of the database instance, non-negative integer
* Field 5: STAT_NAME; statistics’ name
* Field 6: VALUE; statistics’ value, integer


</div>