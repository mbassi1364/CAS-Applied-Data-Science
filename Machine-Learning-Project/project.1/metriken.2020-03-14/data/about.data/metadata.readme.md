<div style="width:1200px;">

# About the Data

## Data Source

The data was taken from the Oracle (11.2.0.4) _performance view_ SYS.DBA_SYSMETRIC_SUMMARY.
This view contains several hundert historicized system statistics, i.e. snapshots of the
real time system metrics. The snapshots are taken at the end of every full hour; however
this might vary due to system restart, or when the database is under stress.

The metrics are measured in regular intervals, usually every 15 oder 60 seconds; this
depends on the metric group (see V$METRICGROUP).

The view SYS.DBA_HIST_SYSMETRIC_SUMMARY is described in the Oracle Database Reference document, to be
found online at http://docs.oracle.com/cd/E11882_01/server.112/e40402/toc.htm.
The metrics metadata are found in the system view DBA_HIST_METRIC_NAME.



## Context

The databases examined is the production database of the SBB CUS platform.
This platform operates a datahub for real-time data of the public transport in Switzerland.
It serves the customer information by various channels, e.g. the information screens
at railway stations or bus stops.

The data is selected from the Performanceview by executiong the SQL
statement below. The beginning of the interval &ndash; 2020-02-13
00:00 &ndash; is due to the retention period limited to 30 days on the
database; and the end of the interval is 2020-03-14 14:00:00.

````sql
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

select snap_id, instance_number, begin_time, end_time, intsize, metric_id, group_id,
  num_interval, minval, average, maxval, standard_deviation
from dba_hist_sysmetric_summary
order by snap_id, instance_number, metric_id, group_id;
````

## Datafiles

The selected data have been exported to the **';'**-delimited file sysmetrics-summary.dsv.

The character set encoding scheme of the export files is UTF-8.

### Datafile Structure

* Format: Text file
* Field separator: “;” (semicolon)
* First line: field names
* 2nd line and below: records
* Field 1: SNAP_ID; snapshot ID, non-negative integer
* Field 2: INSTANCE_NUMBER; ID of the database instance, non-negative integer
* Field 3: BEGIN_TIME; timestamp YYYY-MM-DD HH24:MI:SS
* Field 4: END_TIME; timestamp YYYY-MM-DD HH24:MI:SS
* Field 5: INTSIZE; number of centiseconds the aggregated values encompasse
* Field 6: METRIC_ID; ID of the metric; join to dba_hist_metric_name
* Field 7: GROUP_ID; ID of the metric group; join to v$metricgroup
* Field 8: NUM_INTERVAL; number of intervals the aggregated values emcompasse
* Field 9: MINVAL; minimum value of the metric during the snapshot interval
* Field 10: AVERAGE; average value of the metric during the snapshot interval
* Field 11: MAXVAL; maximum value of the metric during the snapshot interval
* Field 12: STANDARD_DEVIATION; standard deviation of this metric's values during the snapshot interval

</div>