use meta
go

if exists 
  ( select * from sys.tables
    where name = 'ds_column_type')
drop table ds_column_type
go

create table ds_column_type
( column_type_key       int not null identity(1,1) 
, description           varchar(100) not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_ds_column_type
  primary key clustered (column_type_key)
)
go

insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Unknown', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Dimensional key', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Dimensional attribute', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Degenerate dimension', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('SCD support', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Fact', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('System', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Transaction', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Master', getdate(), getdate())
insert into ds_column_type (description, create_timestamp, update_timestamp) 
  values ('Stage', getdate(), getdate())
go
