use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'channel')
drop table channel
go

create table channel
( name                 varchar(20) not null primary key
, description          varchar(50)
, start_date           datetime
, end_date             datetime
, status               varchar(10)
) 
go
