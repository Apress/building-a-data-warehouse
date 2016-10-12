use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dw_user')
drop table dw_user
go

create table dw_user
( [key]             int not null identity(1,1)
, [name]            varchar(100)
, department        varchar(50) 
, [role]            varchar(100)
, email_address     varchar(200)
, phone_number      varchar(20)
, [group]           int
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_user
  primary key clustered ([key])
)
go

