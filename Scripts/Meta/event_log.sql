use meta
go

if exists 
  ( select * from sys.tables
    where name = 'event_log')
drop table event_log
go

create table event_log
( [key]             int not null identity(1,1)
, event_type        int
, event_category    int
, event_timestamp   datetime
, object            int
, dataflow          int
, rows              int
, note              varchar(200)
, constraint pk_event_log
  primary key clustered ([key])
)
go

