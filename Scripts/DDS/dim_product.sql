use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_product_sales_dim_product'
   and parent_object_id = object_id('fact_product_sales'))
alter table fact_product_sales
  drop constraint fk_fact_product_sales_dim_product
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_supplier_performance_dim_product'
   and parent_object_id = object_id('fact_supplier_performance'))
alter table fact_supplier_performance
  drop constraint fk_fact_supplier_performance_dim_product
go

-- Drop and create table:

if exists
  (select * from sys.tables 
   where name = 'dim_product')
drop table dim_product
go

create table dim_product
( product_key          int not null
, product_code         varchar(10)
, name                 varchar(50) 
, description          varchar(100)
, title                varchar(100)
, artist               varchar(100)
, product_type         varchar(20)
, product_category     varchar(30)
, format               varchar(30)
, media                varchar(15)
, unit_price           smallmoney
, unit_cost            smallmoney
, status               varchar(15)
, source_system_code   tinyint 
, create_timestamp     datetime
, update_timestamp     datetime
, constraint pk_dim_product 
  primary key clustered (product_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_product_sales')
alter table fact_product_sales
  add constraint fk_fact_product_sales_dim_product
  foreign key (product_key)
  references dim_product(product_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_supplier_performance')
alter table fact_supplier_performance
  add constraint fk_fact_supplier_performance_dim_product
  foreign key (product_key)
  references dim_product(product_key)
go

-- Build indexes:

if exists 
  (select * from sys.indexes 
   where name = 'dim_product_product_code'
   and object_id = object_id('dim_product'))
drop index dim_product.dim_product_product_code
go

create index dim_product_product_code
  on dim_product(product_code)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_product_title'
   and object_id = object_id('dim_product'))
drop index dim_product.dim_product_title
go

create index dim_product_title
  on dim_product(title)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_product_artist'
   and object_id = object_id('dim_product'))
drop index dim_product.dim_product_artist
go

create index dim_product_artist
  on dim_product(artist)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_product_product_type'
   and object_id = object_id('dim_product'))
drop index dim_product.dim_product_product_type
go

create index dim_product_product_type
  on dim_product(product_type)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_product_product_category'
   and object_id = object_id('dim_product'))
drop index dim_product.dim_product_product_category
go

create index dim_product_product_category
  on dim_product(product_category)
  on dds_fg6
go
