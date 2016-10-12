use NDS
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'communication_subscription')
drop table communication_subscription
go

-- Create the table:

create table communication_subscription
( customer_key              int      not null 
, communication_key         int      not null
, channel_key               int      not null
, subscription_start_date   int
, subscription_end_date     int
, subscription_status_key   int
, source_system_code        tinyint  not null
, create_timestamp          datetime not null
, update_timestamp          datetime not null
, constraint pk_communication_subscription
  primary key clustered (customer_key, communication_key, channel_key)
  on nds_fg6
, constraint fk_communication_subscription_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_communication_subscription_communication
  foreign key (communication_key)
  references communication(communication_key)
, constraint fk_communication_subscription_channel
  foreign key (channel_key)
  references channel(channel_key)
, constraint fk_communication_subscription_subscription_status
  foreign key (subscription_status_key)
  references subscription_status(subscription_status_key)
) on nds_fg4
go

