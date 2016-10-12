use NDS
go

-- Drop the table if exists:

if exists 
  (select * from sys.tables 
   where name = 'channel_junction')
drop table channel_junction
go

-- Create the table:

create table channel_junction
( channel_junction_key  int not null identity(1,1)
, customer_key          int not null
, channel_key           int not null
, channel_type_key      int
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_channel_junction
  primary key clustered (channel_junction_key)
  on nds_fg6
, constraint fk_channel_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_channel_junction_channel
  foreign key (channel_key)
  references channel(channel_key)
) on nds_fg2
go

