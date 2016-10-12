use meta
go

if exists 
  ( select * from sys.tables
    where name = 'data_flow')
drop table data_flow
go

create table data_flow
( [key]            int         not null identity(1,1)
, [name]           varchar(50) not null
, description      varchar(200)
, source           varchar(50)
, target           varchar(50)
, transformation   varchar(200)
, package          varchar(50)           
, status           int
, LSET             datetime
, CET              datetime
, constraint pk_data_flow 
  primary key clustered ([key])
)
go

create index data_flow_name
on data_flow(name)
go

declare @LSET datetime, @CET datetime
set @LSET = '2007-12-01 03:00:00'
set @CET = '2007-12-02 03:00:00'

insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_order_header', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_order_detail', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_customer', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_permission', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_email_address_type', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_address_type', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_phone_number_type', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_product', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_product_status', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_product_category', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_product_type', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_format', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_artist', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_package', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_package_type', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_customer_status', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_customer_type', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_occupation', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_household_income', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_interest', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_currency', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_currency_rate', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_store', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_region', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_division', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('stg_state', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('dds_customer', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('dds_store', '', '', '', '', '', 0, @LSET, @CET)
insert into data_flow ([name], description, source, target, transformation, package, status, LSET, CET) 
  values ('dds_product', '', '', '', '', '', 0, @LSET, @CET)
go