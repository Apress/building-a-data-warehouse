use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_communication_subscription_communication'
   and parent_object_id = object_id('communication_subscription'))
alter table communication_subscription
  drop constraint fk_communication_subscription_communication
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_campaign_result_communication'
   and parent_object_id = object_id('campaign_result'))
alter table campaign_result
  drop constraint fk_campaign_result_communication
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'communication')
drop table communication
go

-- Create the table:

create table communication
( communication_key    int not null identity(1,1)
, title                varchar(50) not null
, description          varchar(200)
, format               varchar(20)
, language_key         int
, category_key         int
, issuing_unit_key     int
, start_date           datetime
, end_date             datetime
, status               varchar(10)
, source_system_code   tinyint not null
, create_timestamp     datetime not null
, update_timestamp     datetime not null
, constraint pk_communication
  primary key clustered (communication_key)
  on nds_fg6
, constraint fk_communication_language
  foreign key (language_key)
  references language(language_key)
, constraint fk_communication_communication_category
  foreign key (category_key)
  references communication_category(communication_category_key)
, constraint fk_communication_business_unit
  foreign key (issuing_unit_key)
  references business_unit(business_unit_key)
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'communication_subscription')
alter table communication_subscription
  add constraint fk_communication_subscription_communication
  foreign key (communication_key)
  references communication(communication_key)
go

if exists
  (select * from sys.tables
   where name = 'campaign_result')
alter table campaign_result
  add constraint fk_campaign_result_communication
  foreign key (communication_key)
  references communication(communication_key)

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'communication_title'
   and object_id = object_id('communication'))
drop index communication.communication_title
go

create unique index communication_title
  on communication(title)
  on nds_fg6
go
