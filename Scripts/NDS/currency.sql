use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_currency_rate_currency'
   and parent_object_id = object_id('currency_rate'))
alter table currency_rate
  drop constraint fk_currency_rate_currency
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'currency')
drop table currency
go

-- Create the table:

create table currency
( currency_key        int not null identity(1,1)
, currency_code       char(3)
, currency_name       varchar(30)
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_currency
  primary key clustered (currency_key)
  on nds_fg6
) on [primary]
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'currency_rate')
alter table currency_rate
  add constraint fk_currency_rate_currency
  foreign key (currency_key)
  references currency(currency_key)
go

-- There is no point creating index as this is a small table