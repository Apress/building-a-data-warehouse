use NDS
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'currency_rate')
drop table currency_rate
go

-- Create the table:

create table currency_rate
( currency_rate_key   int not null identity(1,1)
, effective_date      datetime
, currency_key        int
, currency_rate       money
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_currency_rate
  primary key clustered (currency_rate_key)
  on nds_fg6
, constraint fk_currency_rate_currency
  foreign key (currency_key)
  references currency(currency_key)
) on [primary]
go

-- There is no point creating index as this is a small table