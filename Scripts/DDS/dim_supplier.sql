use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_supplier_performance_dim_supplier'
   and parent_object_id = object_id('fact_supplier_performance'))
alter table fact_supplier_performance
  drop constraint fk_fact_supplier_performance_dim_supplier
go

-- Drop and create table:

if exists 
  (select * from sys.tables
   where name = 'dim_supplier')
drop table dim_supplier
go

create table dim_supplier
( supplier_key         int not null
, supplier_code        varchar(12)
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
, effective_timestamp  datetime
, expiry_timestamp     datetime
, is_current           tinyint
, source_system_code   tinyint
, create_timestamp     datetime
, update_timestamp     datetime
, constraint pk_dim_supplier
  primary key clustered (supplier_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_supplier_performance')
alter table fact_supplier_performance
  add constraint fk_fact_supplier_performance_dim_supplier
  foreign key (supplier_key)
  references dim_supplier(supplier_key)
go
