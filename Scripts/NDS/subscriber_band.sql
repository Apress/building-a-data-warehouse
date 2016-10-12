use NDS
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_customer_subscriber_band'
   and parent_object_id = object_id('customer'))
alter table customer
  drop constraint fk_customer_subscriber_band
go

if exists 
  (select * from sys.tables 
   where name = 'subscriber_band')
drop table subscriber_band
go

create table subscriber_band
( subscriber_band_key   int not null identity(1,1)
, band_code             varchar(2) not null unique
, lower_limit           decimal(9,2)
, upper_limit           decimal(9,2)
, description           varchar(30)
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_subscriber_band 
  primary key clustered (subscriber_band_key)
  on nds_fg6
) on nds_fg2
go

if exists
  (select * from sys.tables
   where name = 'customer')
alter table customer 
  add constraint fk_customer_subscriber_band
  foreign key (subscriber_band_key)
  references subscriber_band(subscriber_band_key)
go

-- there is no point creating index as this is a tiny table