use meta
go

if exists 
  ( select * from sys.tables
    where name = 'ds_table_type')
drop table ds_table_type
go

create table ds_table_type
( table_type_key      int not null identity(1,1) 
, table_type          varchar(30) 
, description         varchar(100) not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_ds_table_type
  primary key clustered (table_type_key)
)
go

insert into ds_table_type (table_type, description, create_timestamp, update_timestamp) 
  values ('dimension', 'dimension table', getdate(), getdate())
insert into ds_table_type (table_type, description, create_timestamp, update_timestamp) 
  values ('fact', 'fact table', getdate(), getdate())
insert into ds_table_type (table_type, description, create_timestamp, update_timestamp) 
  values ('master', 'master table', getdate(), getdate())
insert into ds_table_type (table_type, description, create_timestamp, update_timestamp) 
  values ('transaction', 'transaction table', getdate(), getdate())
insert into ds_table_type (table_type, description, create_timestamp, update_timestamp) 
  values ('stage', 'stage table', getdate(), getdate())
insert into ds_table_type (table_type, description, create_timestamp, update_timestamp) 
  values ('metadata', 'metadata table', getdate(), getdate())
go
