use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'permission')
drop table permission
go

create table permission
( permission_code       varchar(2) 
, description           varchar(30)
)
go

