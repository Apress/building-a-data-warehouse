use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dq_notification')
drop table dq_notification
go

create table dq_notification
( [key]             int not null identity(1,1)
, rule_key          int not null
, recipient_type    char(1) 
, recipient         int
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_dq_notification
  primary key clustered ([key])
)
go

