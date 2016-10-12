use stage
go

if exists
( select * from sys.tables
  where name = 'language')
drop table language
go

create table language
( code      char(3)
, language  varchar(50)
)
go