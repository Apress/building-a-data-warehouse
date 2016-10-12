use DDS
go

if exists 
  (select * from sys.views 
   where name = 'dim_week')
drop view dim_week
go

create view dim_week
as select
date_key
, date
, system_date
, sql_date
, julian_date
, day
, day_of_the_year
, week_number
, month
, month_name
, short_month_name
, quarter
, year
, fiscal_week
, fiscal_period
, fiscal_quarter
, fiscal_year
, source_system_code
, create_timestamp
, update_timestamp
from dim_date
where day_of_the_week = 1
go

