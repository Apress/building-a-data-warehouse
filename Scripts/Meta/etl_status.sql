use meta
go

if exists 
  ( select * from sys.tables
    where name = 'etl_status')
drop table etl_status
go

create table etl_status
( [key]             int         not null identity(1,1)
, status            varchar(50) not null
, create_timestamp  datetime
, update_timestamp  datetime
, constraint pk_etl_status 
  primary key clustered ([key])
)
go

