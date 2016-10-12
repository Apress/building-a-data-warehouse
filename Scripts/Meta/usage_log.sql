use meta
go

if exists 
  ( select * from sys.tables
    where name = 'usage_log')
drop table usage_log
go

create table usage_log
( [key]             int not null identity(1,1)
, [user]            int
, object            int
, [timestamp]       int
, parameters        varchar(100)
, note              varchar(200)
, constraint pk_usage_log
  primary key clustered ([key])
)
go

