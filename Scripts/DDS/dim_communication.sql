use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_campaign_result_dim_communication'
   and parent_object_id = object_id('fact_campaign_result'))
alter table fact_campaign_result
  drop constraint fk_fact_campaign_result_dim_communication
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_communication_subscription_dim_communication'
   and parent_object_id = object_id('fact_communication_subscription'))
alter table fact_communication_subscription
  drop constraint fk_fact_communication_subscription_dim_communication
go

-- Drop and create the table:

if exists 
  (select * from sys.tables
   where name = 'dim_communication')
drop table dim_communication
go

create table dim_communication
( communication_key    int not null
, title                varchar(50)
, description          varchar(200)
, format               varchar(20)
, language             varchar(50)
, category             varchar(20)
, issuing_unit         varchar(30)
, issuing_country      char(3)
, start_date           datetime
, end_date             datetime
, status               varchar(10)
, source_system_code   tinyint   not null
, create_timestamp     datetime  not null
, update_timestamp     datetime  not null
, constraint pk_dim_communication
  primary key clustered (communication_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_campaign_result')
alter table fact_campaign_result
  add constraint fk_fact_campaign_result_dim_communication
  foreign key (communication_key)
  references dim_communication(communication_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_communication_subscription')
alter table fact_communication_subscription
  add constraint fk_fact_communication_subscription_dim_communication
  foreign key (communication_key)
  references dim_communication(communication_key)
go