use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_campaign_result_dim_campaign'
   and parent_object_id = object_id('fact_campaign_result'))
alter table fact_campaign_result
  drop constraint fk_fact_campaign_result_dim_campaign
go

-- Drop and create the table:

if exists 
  (select * from sys.tables
   where name = 'dim_campaign')
drop table dim_campaign
go

create table dim_campaign
( campaign_key         int not null
, campaign_title       varchar(50) not null
, description          varchar(100)
, planned_send_date    smalldatetime
, number_of_recipients int
, communication_name   varchar(50)
, source_system_code   tinyint   not null
, create_timestamp     datetime  not null
, update_timestamp     datetime  not null
, constraint pk_dim_campaign
  primary key clustered (campaign_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_campaign_result')
alter table fact_campaign_result
  add constraint fk_fact_campaign_result_dim_campaign
  foreign key (campaign_key)
  references dim_campaign(campaign_key)
go