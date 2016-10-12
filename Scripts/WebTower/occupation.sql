use WebTower
go

if exists 
  (select * from sys.tables 
   where name = 'occupation')
drop table occupation
go

create table occupation
( occupation_code      varchar(10) not null primary key
, occupation           varchar(30)
, description          varchar(50)
, category             varchar(30)
)
go
