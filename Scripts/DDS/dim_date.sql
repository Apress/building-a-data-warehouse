use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_campaign_result_dim_date'
   and parent_object_id = object_id('fact_campaign_result'))
alter table fact_campaign_result
  drop constraint fk_fact_campaign_result_dim_date
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_communication_subscription_dim_date1'
   and parent_object_id = object_id('fact_communication_subscription'))
alter table fact_communication_subscription
  drop constraint fk_fact_communication_subscription_dim_date1
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_communication_subscription_dim_date2'
   and parent_object_id = object_id('fact_communication_subscription'))
alter table fact_communication_subscription
  drop constraint fk_fact_communication_subscription_dim_date2
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_product_sales_dim_date'
   and parent_object_id = object_id('fact_product_sales'))
alter table fact_product_sales
  drop constraint fk_fact_product_sales_dim_date
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_date1'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_date1
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_date2'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_date2
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_date3'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_date3
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_supplier_performance_dim_date1'
   and parent_object_id = object_id('fact_supplier_performance'))
alter table fact_supplier_performance
  drop constraint fk_fact_supplier_performance_dim_date1
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_supplier_performance_dim_date2'
   and parent_object_id = object_id('fact_supplier_performance'))
alter table fact_supplier_performance
  drop constraint fk_fact_supplier_performance_dim_date2
go

-- Drop and create the table:

if exists 
  (select * from sys.tables 
   where name = 'dim_date')
drop table dim_date
go

create table dim_date
( date_key             int        not null identity(1,1)
, date                 char(10)   not null
, system_date          char(10)   not null
, sql_date             datetime   not null
, julian_date          int        not null
, day                  tinyint    not null
, day_of_the_week      tinyint    not null
, day_name             varchar(9) not null
, day_of_the_year      smallint   not null
, week_number          tinyint    not null
, month                tinyint    not null
, month_name           varchar(9) not null
, short_month_name     char(3)    not null
, quarter              char(2)    not null
, year                 smallint   not null
, fiscal_week          tinyint    
, fiscal_period        char(4)
, fiscal_quarter       char(3)
, fiscal_year          char(6)
, week_day             tinyint    not null
, us_holiday           tinyint
, uk_holiday           tinyint
, month_end            tinyint    not null
, period_end           tinyint
, short_day            tinyint
, source_system_code   tinyint    not null
, create_timestamp     datetime   not null
, update_timestamp     datetime   not null
, constraint pk_dim_date 
  primary key clustered (date_key) 
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_campaign_result')
alter table fact_campaign_result
  add constraint fk_fact_campaign_result_dim_date
  foreign key (send_date_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_communication_subscription')
alter table fact_communication_subscription
  add constraint fk_fact_communication_subscription_dim_date1
  foreign key (subscription_start_date_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_communication_subscription')
alter table fact_communication_subscription
  add constraint fk_fact_communication_subscription_dim_date2
  foreign key (subscription_end_date_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_product_sales')
alter table fact_product_sales
  add constraint fk_fact_product_sales_dim_date
  foreign key (sales_date_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_date1
  foreign key (date_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_date2
  foreign key (start_date_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_date3
  foreign key (end_date_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_supplier_performance')
alter table fact_supplier_performance
  add constraint fk_fact_supplier_performance_dim_date1
  foreign key (week_key)
  references dim_date(date_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_supplier_performance')
alter table fact_supplier_performance
  add constraint fk_fact_supplier_performance_dim_date2
  foreign key (start_date_key)
  references dim_date(date_key)
go

-- Populate the dimension table

declare @start_date datetime, @end_date datetime
set @start_date = '1998-01-01'
set @end_date = '2010-12-31'

declare @date datetime, @day int, @cday char(2)
  , @day_of_the_week int, @day_name varchar(8)
  , @day_of_the_year int, @week_number int, @month int
  , @cmonth char(2), @month_name varchar(9)
  , @quarter char(2), @year int, @cyear char(4)
  , @fiscal_week int, @fiscal_period char(4)
  , @fiscal_start_date datetime, @fiscal_quarter char(3)
  , @fiscal_year char(6), @week_day tinyint
  , @month_end tinyint, @period_end tinyint

set @date = @start_date

while @date <= @end_date
begin
  set @day = datepart(d, @date)
  set @cday = right('00' + convert(varchar,@day),2)
  set @day_of_the_week = datepart(dw, @date)
  set @day_name = datename(dw, @date)
  set @day_of_the_year = datepart(y, @date)
  set @week_number = datepart(ww, @date)
  set @month = datepart(m, @date)
  set @cmonth = right('00' + convert(varchar, @month), 2)
  set @month_name = datename(m, @date)
  set @quarter = 'Q' + datename(q, @date)
  set @year = datepart(yyyy, @date)
  set @cyear = convert(varchar, @year)

  -- Fiscal week is the number of weeks since Sep 1.
  set @fiscal_week = dds.dbo.fiscal_week(@date)
  -- Fiscal period is based on 454 454 454 454 pattern.
  set @fiscal_period = dds.dbo.fiscal_period(@fiscal_week)
  -- Fiscal quarter is fiscal week divided by 3
  set @fiscal_quarter = 'FQ' + convert(varchar,floor(
    convert(int,substring(@fiscal_period,3,2)) / 3.0 + 0.9))

  -- Sep to Dec fiscal year = calendar year
  -- , Jan to Aug fiscal year = calendar year + 1
  if @month between 1 and 8 set @fiscal_year = 'FY'+@cyear
  else set @fiscal_year = 'FY'+convert(char,@year+1)

  -- Week day = 1 if it's Monday to Friday
  if @day_of_the_week between 2 and 6
    set @week_day = 1
  else set @week_day = 0

  -- If adding 1 day to @date changes its month, it's a month end
  if month(dateadd(d,1,@date)) <> @month set @month_end = 1
  else set @month_end = 0

  -- If adding 1 day to @date changes its period, it's a period end
  if dds.dbo.fiscal_period(dds.dbo.fiscal_week(dateadd(d,1,@date))) 
    <> dds.dbo.fiscal_period(dds.dbo.fiscal_week(@date))
    set @period_end = 1
  else set @period_end = 0

  insert into dim_date
  ( date, system_date, sql_date, julian_date
    , day, day_of_the_week, day_name, day_of_the_year
    , week_number, month, month_name, short_month_name
    , quarter, year, fiscal_week, fiscal_period
    , fiscal_quarter, fiscal_year, week_day	
    , us_holiday, uk_holiday, month_end
    , period_end, short_day, source_system_code
    , create_timestamp, update_timestamp )
  select @cmonth + '/' + @cday + '/' + @cyear as date
  , @cyear + '-' + @cmonth + '-' + @cday as system_date
  , @date as sql_date
  , datediff(d, '1900-01-01', @date) as julian_date
  , @day as day
  , @day_of_the_week as day_of_the_week
  , @day_name as day_name
  , @day_of_the_year as day_of_the_year
  , @week_number as week_number, @month as month
  , @month_name as month_name
  , left(@month_name,3) as short_month_name
  , @quarter as quarter
  , @year as year
  , @fiscal_week as fiscal_week
  , @fiscal_period as fiscal_period
  , @fiscal_quarter as fiscal_quarter
  , @fiscal_year as fiscal_year
  , @week_day as week_day
  , 0 as uk_holiday
  , 0 as us_holiday
  , @month_end as month_end 
  , @period_end as period_end
  , 0 as short_day
  , 0 as short_system_code
  , getdate() as create_timestamp
  , getdate() as update_timestamp

  set @date = @date + 1

end 

-- Build the indexes:

if exists 
  (select * from sys.indexes 
   where name = 'dim_date_sql_date'
   and object_id = object_id('dim_date'))
drop index dim_date.dim_date_sql_date
go

create unique index dim_date_sql_date
  on dim_date(sql_date)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_date_date'
   and object_id = object_id('dim_date'))
drop index dim_date.dim_date_date
go

create unique index dim_date_date
  on dim_date(date)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_date_system_date'
   and object_id = object_id('dim_date'))
drop index dim_date.dim_date_system_date
go

create unique index dim_date_system_date
  on dim_date(system_date)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_date_day_of_the_week'
   and object_id = object_id('dim_date'))
drop index dim_date.dim_date_day_of_the_week
go

create index dim_date_day_of_the_week
  on dim_date(day_of_the_week)
  on dds_fg6
go
