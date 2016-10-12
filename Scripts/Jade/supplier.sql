use Jade
go

if exists 
  (select * from sys.tables
   where name = 'supplier')
drop table supplier
go

create table supplier
( supplier_code        varchar(12) not null primary key
, account_number       int
, short_name           varchar(30)
, full_name            varchar(50)
, address1             varchar(50)
, address2             varchar(50)
, address3             varchar(50)
, address4             varchar(50)
, city                 varchar(50)
, state                varchar(40)
, zipcode              varchar(10)
, country              varchar(50)
, phone_number         varchar(20)
, status               varchar(10)
, email_address        varchar(200)
, website              varchar(100)
, contact_name         varchar(100)
, contact_title        varchar(50)
) 
go
