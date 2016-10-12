use meta
go

if exists 
  ( select * from sys.tables
    where name = 'ds_column')
drop table ds_column
go

create table ds_column
( column_key         int not null identity(1,1)
, table_key          int not null
, column_name        varchar(100) not null 
, data_type          varchar(50) not null
, is_PK              char(1)
, is_FK              char(1)
, is_null            char(1)
, is_identity        char(1)
, create_timestamp   datetime not null
, update_timestamp   datetime not null
, constraint pk_ds_column
  primary key clustered (column_key)
)
go

use dds
go

insert into meta.dbo.ds_column 
( table_key, column_name, data_type
, is_PK, is_FK, is_null, is_identity
, create_timestamp, update_timestamp )
select coalesce(t2.table_key, 0) as table_key
, c.name as column_name
, case when ty.name in ('char', 'varchar') 
  then ty.name + '(' + convert(varchar, c.max_length) + ')' 
  else 
    case when ty.name in ('decimal', 'float')
    then ty.name + '(' + convert(varchar, c.precision) 
      + ',' + convert(varchar,c.scale) + ')' 
    else ty.name 
    end  
  end as data_type
, case coalesce(a.index_column_id, 0) when 0 then 'N' else 'Y' end as is_PK
, case coalesce(fkc.parent_column_id, 0) when 0 then 'N' else 'Y' end as is_FK
, case c.is_nullable when 0 then 'N' else 'Y' end as is_null
, case c.is_identity when 0 then 'N' else 'Y' end as is_identity
, getdate() as create_timestamp
, getdate() as update_timestamp
from sys.tables t
inner join sys.columns c 
  on t.object_id = c.object_id
inner join sys.types ty 
  on c.system_type_id = ty.system_type_id
left join 
( select i.object_id, ic.index_column_id 
from sys.indexes i
inner join sys.index_columns ic 
  on i.object_id = ic.object_id 
 and i.index_id = ic.index_id
 and i.is_primary_key = 1 
) a
 on t.object_id = a.object_id
and c.column_id = a.index_column_id
left join sys.foreign_key_columns fkc
 on t.object_id = fkc.parent_object_id
and c.column_id = fkc.parent_column_id 
left join meta.dbo.ds_table t2
  on t.name = t2.table_name
order by table_key, c.column_id
go

