use stage
go

if exists
( select * from sys.tables
  where name = 'country')
drop table language
go

create table country
( country_code        char(2)
, country_name        varchar(50)
)
go