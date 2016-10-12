use NDS
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_customer_household_income'
   and parent_object_id = object_id('customer'))
alter table customer
  drop constraint fk_customer_household_income
go

if exists 
  (select * from sys.tables 
   where name = 'household_income')
drop table household_income
go

create table household_income
( household_income_key   int not null identity(1,1)
, household_income_code  int not null unique
, lower_limit            money
, upper_limit            money
, description            varchar(30)
, source_system_code     tinyint not null
, create_timestamp       datetime not null
, update_timestamp       datetime not null
, constraint pk_household_income 
  primary key clustered (household_income_key)
  on nds_fg6
) on nds_fg2
go

if exists
  (select * from sys.tables
   where name = 'customer')
alter table customer 
  add constraint fk_customer_household_income
  foreign key (household_income_key)
  references household_income(household_income_key)
go

-- There is no point creating index as this is a tiny table