use meta
go

if exists 
  ( select * from sys.tables
    where name = 'event_category')
drop table event_category
go

create table event_category
( [key]         int not null identity(1,1)
, event_category    varchar(100)
, constraint pk_event_category
  primary key clustered ([key])
)
go

