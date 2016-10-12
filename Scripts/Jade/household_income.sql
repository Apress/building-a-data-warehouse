use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'household_income')
drop table household_income
go

create table household_income
( household_income_code  int not null primary key
, lower_limit            money
, upper_limit            money
, description            varchar(30)
)
go
