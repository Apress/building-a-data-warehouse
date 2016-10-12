use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dp_source_column')
drop table dp_source_column
go

create table dp_source_column
( column_key         int not null identity(1,1)
, table_key          int not null
, unique_values      bigint 
, min_value          varchar(50) 
, max_value          varchar(50)
, avg_value          varchar(50)
, max_length         int
, nulls              bigint
, create_timestamp   datetime not null
, update_timestamp   datetime not null
, constraint pk_dp_source_column
  primary key clustered (column_key)
)
go
