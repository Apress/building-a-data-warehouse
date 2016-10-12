use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_communication_subscription_subscription_status'
   and parent_object_id = object_id('communication_subscription'))
alter table communication_subscription
  drop constraint fk_communication_subscription_subscription_status
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'subscription_status')
drop table subscription_status
go

-- Create the table:

create table subscription_status
( subscription_status_key    int not null identity(1,1)
, subscription_status_code   char(3) not null
, description                varchar(50)
, source_system_code         tinyint not null
, create_timestamp           datetime not null
, update_timestamp           datetime not null
, constraint pk_subscription_status
  primary key clustered (subscription_status_key)
  on nds_fg6
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'communication_subscription')
alter table communication_subscription
  add constraint fk_communication_subscription_subscription_status
  foreign key (subscription_status_key)
  references subscription_status(subscription_status_key)
go

-- There is no need creating indexes as this is a tiny table