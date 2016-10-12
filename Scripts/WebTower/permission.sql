use WebTower
go

if exists 
  (select * from sys.tables 
   where name = 'permission')
drop table permission
go

create table permission
( permission_code       varchar(2) not null primary key
, description           varchar(30)
)
go

insert into permission ( permission_code, description )
values ('A', 'Amadeus Entertainment Group')
insert into permission ( permission_code, description )
values ('T', 'Third Party and Amadeus EG' )
go