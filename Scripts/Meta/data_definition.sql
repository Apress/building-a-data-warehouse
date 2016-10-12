use meta
go

if exists 
  ( select * from sys.tables
    where name = 'data_definition')
drop table data_definition
go

create table data_definition
( column_key          int  not null 
, table_key           int  not null
, column_type_key     int  not null
, description         varchar(200)
, sample_values       varchar(50)
, source_column_key   int  not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_data_definition
  primary key clustered (column_key)
)
go

create index data_definition_description
on data_definition(description)
go

if exists 
( select * from sys.fulltext_indexes 
  where object_id = object_id('data_definition'))
drop fulltext index on data_definition
go

if exists
( select * from sys.fulltext_catalogs
  where name = 'data_definition_fulltext_catalog')
drop fulltext catalog data_definition_fulltext_catalog
go

backup log meta to disk = 'd:\disk\data6\meta.trn'
go

create fulltext catalog data_definition_fulltext_catalog 
in path 'd:\disk\data6'
as default
go

create fulltext index 
on data_definition (description)
key index pk_data_definition
go