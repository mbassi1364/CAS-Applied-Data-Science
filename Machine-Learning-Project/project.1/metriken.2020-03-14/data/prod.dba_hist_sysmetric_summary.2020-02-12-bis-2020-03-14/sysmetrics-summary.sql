alter session set nls_date_format = 'YYYY-MM-DD HH24:MI';

select snap_id, instance_number, begin_time, end_time, intsize, metric_id, group_id,
  num_interval, minval, average, maxval, standard_deviation
from dba_hist_sysmetric_summary
order by snap_id, instance_number, metric_id, group_id;
