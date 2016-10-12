use Jupiter
go

if exists 
  (select * from sys.tables 
   where name = 'state')
drop table state
go

create table state
( state_code              varchar(2)  not null primary key
, state_name              varchar(50)
, formal_name             varchar(100)
, admission_to_statehood  varchar(10)
, population              int
, capital                 varchar(50)
, largest_city            varchar(50)
)
go
