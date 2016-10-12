use Stage
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'format')
drop table format
go

-- Create the table:

create table format
( format             varchar(30) not null
, description        varchar(50)
, media              varchar(15)
) 
go

