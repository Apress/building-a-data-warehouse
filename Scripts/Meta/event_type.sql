use meta
go

if exists 
  ( select * from sys.tables
    where name = 'event_type')
drop table event_type
go

create table event_type
( [key]         int not null identity(1,1)
, event_type    varchar(100)
, constraint pk_event_type
  primary key clustered ([key])
)
go

