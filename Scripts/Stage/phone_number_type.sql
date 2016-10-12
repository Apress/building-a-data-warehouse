use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'phone_number_type')
drop table phone_number_type
go

create table phone_number_type
( phone_number_type_code   char(2)
, phone_number_type        varchar(10)
, description              varchar(30)
)
go
