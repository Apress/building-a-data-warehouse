use NDS
go

-- Remove FK if exist:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_campaign_result_delivery_status'
   and parent_object_id = object_id('campaign_result'))
alter table campaign_result
  drop constraint fk_campaign_result_delivery_status
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'delivery_status')
drop table delivery_status
go

-- Create the table:

create table delivery_status
( delivery_status_key   int not null identity(1,1)
, delivery_status_code  int
, description           varchar(50)
, category_key          int
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_delivery_status
  primary key clustered (delivery_status_key)
  on nds_fg6
, constraint fk_delivery_status_delivery_status_category
  foreign key (category_key)
  references delivery_status_category(delivery_status_category_key)
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'campaign_result')
alter table campaign_result
  add constraint fk_campaign_result_delivery_status
  foreign key (delivery_status_key)
  references delivery_status(delivery_status_key)
go

-- There is no point creating indexes as this is a small table