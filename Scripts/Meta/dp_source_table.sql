use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dp_source_table')
drop table dp_source_table
go

create table dp_source_table
( table_key          int not null identity(1,1)
, rows               bigint 
, row_size           int 
, columns            int 
, has_timestamp      char(1)
, create_timestamp   datetime not null
, update_timestamp   datetime not null
, constraint pk_dp_source_table
  primary key clustered (table_key)
)
go
