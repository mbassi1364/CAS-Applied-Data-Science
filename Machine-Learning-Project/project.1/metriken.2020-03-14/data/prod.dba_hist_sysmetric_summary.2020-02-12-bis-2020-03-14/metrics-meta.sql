with base_select as (
  select distinct dhss.metric_id, dhss.group_id
  from dba_hist_sysmetric_summary dhss
)
select dhmn.metric_id, dhmn.metric_name, dhmn.metric_unit, dhmn.group_id, dhmn.group_name,
  mg.interval_size, mg.max_interval
from dba_hist_metric_name dhmn
join v$metricgroup mg on (
  mg.group_id = dhmn.group_id
  and mg.name = dhmn.group_name
)
join base_select bs on (
  bs.metric_id = dhmn.metric_id
  and bs.group_id = dhmn.group_id
)
order by dhmn.metric_id, dhmn.group_id;
