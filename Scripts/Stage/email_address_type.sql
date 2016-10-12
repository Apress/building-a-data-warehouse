use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'email_address_type')
drop table email_address_type
go

create table email_address_type
( email_address_type_code   char(2)
, email_address_type        varchar(10)
, description               varchar(30)
)
go
