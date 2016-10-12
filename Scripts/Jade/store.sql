use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'store')
drop table store
go

create table store
( store_number         smallint    not null primary key
, store_name           varchar(40)
, store_type           varchar(20)
, address1             varchar(50)
, address2             varchar(50)
, address3             varchar(50)
, address4             varchar(50)
, city                 varchar(50)
, state                varchar(40)
, zipcode              varchar(10)
, country              varchar(50)
, phone_number         varchar(20)
, web_site             varchar(100)
, region               varchar(30)
, division             varchar(30)
, created              datetime
, last_updated         datetime
)
go
