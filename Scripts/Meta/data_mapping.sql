use meta
go

if exists 
  ( select * from sys.tables
    where name = 'data_mapping')
drop table data_mapping
go

create table data_mapping
( data_mapping_key    int not null identity(1,1)
, column_key          int not null 
, source_column_key   int
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_data_mapping
  primary key clustered (data_mapping_key)
)
go

