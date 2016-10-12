use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_campaign_result_dim_delivery_status'
   and parent_object_id = object_id('fact_campaign_result'))
alter table fact_campaign_result
  drop constraint fk_fact_campaign_result_dim_delivery_status
go

-- Drop and create table:

if exists 
  (select * from sys.tables
   where name = 'dim_delivery_status')
drop table dim_delivery_status
go

create table dim_delivery_status
( delivery_status_key   int not null
, delivery_status_code  int not null
, description           varchar(50)
, category              varchar(20)
, source_system_code    tinyint   not null
, create_timestamp      datetime  not null
, update_timestamp      datetime  not null
, constraint pk_dim_delivery_status
  primary key clustered (delivery_status_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_campaign_result')
alter table fact_campaign_result
  add constraint fk_fact_campaign_result_dim_delivery_status
  foreign key (delivery_status_key)
  references dim_delivery_status(delivery_status_key)
go
