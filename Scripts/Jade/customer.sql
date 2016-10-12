use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'customer')
drop table customer
go

create table customer
( customer_number      varchar(10) not null primary key
, account_number       int
, customer_type        char(1)
, name                 varchar(100)
, gender               char(1)
, email_address        varchar(200)
, date_of_birth        datetime
, address1             varchar(50)
, address2             varchar(50)
, address3             varchar(50)
, address4             varchar(50)
, city                 varchar(50)
, state                varchar(40)
, zipcode              varchar(10)
, country              varchar(50)
, phone_number         varchar(20)
, occupation           varchar(50)
, household_income     int
, date_registered      datetime
, status               varchar(3)
, permission           varchar(2)
, preferred_channel1   varchar(20)
, preferred_channel2   varchar(20)
, interest1            varchar(30)
, interest2            varchar(30)
, interest3            varchar(30)
, created              datetime
, last_updated         datetime
) 
go
