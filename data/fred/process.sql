-- select *
-- from information_schema.columns
-- where table_name = 'fred_metrics_data'
-- ;

drop table if exists proc.fred_metrics;
create table if not exists proc.fred_metrics (
    metric_dt date
    ,metric_val float
    ,metric_id varchar(255)
    ,metric_desc varchar(255)
    ,topic varchar(100)
    ,state_ind int
    ,rolling_12mo_avg float
    ,rolling_12mo_avg_pct_chg float
    ,state_nm varchar(100)
    ,metric_unit varchar(100)
);

insert into proc.fred_metrics (
    metric_dt
    ,metric_val
    ,metric_id
    ,metric_desc
    ,topic
    ,state_ind
)
select metric_dt
    ,metric as metric_val
    ,metric_id
    ,metric_desc
    ,topic
    ,state_ind
from base.fred_metrics_data
;

update proc.fred_metrics
set state_nm = trim(split_part(,'-',2)
where state_ind = 1
;