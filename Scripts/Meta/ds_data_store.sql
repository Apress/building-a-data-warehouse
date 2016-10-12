use meta
go

if exists 
  ( select * from sys.tables
    where name = 'ds_data_store')
drop table ds_data_store
go

create table ds_data_store
( data_store_key     int not null identity(1,1)
, data_store_name    varchar(30) not null 
, description        varchar(200)
, DBMS               varchar(30)
, collation          varchar(50)
, current_size       decimal(9,2)
, growth             decimal(9,2)
, create_timestamp   datetime not null
, update_timestamp   datetime not null
, constraint pk_ds_data_store
  primary key clustered (data_store_key)
)
go

insert into ds_data_store (data_store_name, description, DBMS, collation
, current_size, growth, create_timestamp, update_timestamp)
values ('Stage', 'Staging area', 'SQL Server 2005', 'SQL_Latin1_General_CP1_CI_AS'
, 70, 10, getdate(), getdate())

insert into ds_data_store (data_store_name, description, DBMS, collation
, current_size, growth, create_timestamp, update_timestamp)
values ('NDS', 'Normalized Data Store', 'SQL Server 2005', 'SQL_Latin1_General_CP1_CI_AS'
, 225, 25, getdate(), getdate())

insert into ds_data_store (data_store_name, description, DBMS, collation
, current_size, growth, create_timestamp, update_timestamp)
values ('DDS', 'Dimensional Data Store', 'SQL Server 2005', 'SQL_Latin1_General_CP1_CI_AS'
, 350, 25, getdate(), getdate())

insert into ds_data_store (data_store_name, description, DBMS, collation
, current_size, growth, create_timestamp, update_timestamp)
values ('Meta', 'Metadata database', 'SQL Server 2005', 'SQL_Latin1_General_CP1_CI_AS'
, 10, 5, getdate(), getdate())

insert into ds_data_store (data_store_name, description, DBMS, collation
, current_size, growth, create_timestamp, update_timestamp)
values ('Jade', 'A custom Java based system running on Informix. This includes sales, customer service, subscriptions and front office functions.'
, 'Informix Dynamic Server 10', 'Unicode', 430, 30, getdate(), getdate())

insert into ds_data_store (data_store_name, description, DBMS, collation
, current_size, growth, create_timestamp, update_timestamp)
values ('WebTower', 'A custom developed .NET based system for dynamic web site, multimedia trading, broadcasting, sales order processing and subscription management, running on Oracle database.'
, 'Oracle 10g R2', 'ANSI', 845, 65, getdate(), getdate())

insert into ds_data_store (data_store_name, description, DBMS, collation
, current_size, growth, create_timestamp, update_timestamp)
values ('Jupiter', 'The back end Enterprise Resource Planning (ERP) system. An off-the-shelf AS/400 based business system running on DB2.'
, 'DB2 Enterprise 9', 'EBCDIC', 800, 50, getdate(), getdate())
go