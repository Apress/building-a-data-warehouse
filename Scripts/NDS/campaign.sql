use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_campaign_result_campaign'
   and parent_object_id = object_id('campaign_result'))
alter table campaign_result
  drop constraint fk_campaign_result_campaign
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'campaign')
drop table campaign
go

-- Create the table:

create table campaign
( campaign_key          int not null identity(1,1)
, campaign_code         char(5) not null
, campaign_title        varchar(50) null
, description           varchar(100)
, planned_send_date     datetime
, number_of_recipients  int
, communication_name    varchar(50)
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_campaign
  primary key clustered (campaign_key)
  on nds_fg6
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'campaign_result')
alter table campaign_result
  add constraint fk_campaign_result_campaign
  foreign key (campaign_key)
  references campaign(campaign_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes 
   where name = 'campaign_code' 
   and object_id = object_id('campaign'))
drop index campaign.campaign_code
go

create unique index campaign_code
  on campaign(campaign_code)
  on nds_fg6
go
