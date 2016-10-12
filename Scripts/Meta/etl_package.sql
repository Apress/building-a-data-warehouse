use meta
go

if exists 
  ( select * from sys.tables
    where name = 'etl_package')
drop table etl_package
go

create table etl_package
( [key]             int         not null identity(1,1)
, [name]            varchar(50) not null
, description       varchar(200)
, schedule          varchar(50)
, create_timestamp  datetime
, update_timestamp  datetime
, constraint pk_etl_package 
  primary key clustered ([key])
)
go

