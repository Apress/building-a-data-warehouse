use meta
go

if exists 
  ( select * from sys.tables
    where name = 'ds_table')
drop table ds_table
go

create table ds_table
( table_key          int not null identity(1,1)
, table_name         varchar(50) not null 
, table_type         int not null
, data_store         int not null
, description        varchar(200) not null
, create_timestamp   datetime not null
, update_timestamp   datetime not null
, constraint pk_ds_table
  primary key clustered (table_key)
)
go

use dds
insert into meta.dbo.ds_table
( table_name, table_type, data_store, description
, create_timestamp, update_timestamp )
select [name] as table_name
, case left([name], charindex('_', [name])-1) 
  when 'dim' then 1
  when 'fact' then 2
  else 0 end as table_type
, 3 as data_store
, [name] + 'table' as table_name
, getdate() as create_timestamp
, getdate() as update_timestamp
from sys.tables t

