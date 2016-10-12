use DDS
go

-- Drop and create the table:
if exists 
  (select * from sys.tables 
   where name = 'dm_purchase_pattern')
drop table dm_purchase_pattern
go

create table dm_purchase_pattern
( customer_key	int
, gender		char(1)
, interest		varchar(30)
, occupation	varchar(50)
, music			char(1)
, film			char(1)
, audio_books	char(1)
, constraint pk_dm_purchase_pattern
  primary key clustered (customer_key)
  on dds_fg6
) on dds_fg6
go

-- Populate the table
insert into dm_purchase_pattern
(customer_key, gender, interest, occupation, music, film, audio_books)
select c.customer_key, c.gender, c.interest1, c.occupation
, case sum(case p.product_category when 'Music' then 1 else 0 end) when 0 then 'N' else 'Y' end as music
, case sum(case p.product_category when 'Films' then 1 else 0 end) when 0 then 'N' else 'Y' end as films
, case sum(case p.product_category when 'Audio Books' then 1 else 0 end) when 0 then 'N' else 'Y' end as audio_books
from fact_product_sales f
join dim_product p on f.product_key = p.product_key
join dim_customer c on f.customer_key = c.customer_key
group by c.customer_key, c.gender, c.interest1, c.occupation
go

-- Create index
if exists 
  (select * from sys.indexes 
   where name = 'dm_purchase_pattern_occupation'
   and object_id = object_id('dm_purchase_pattern'))
drop index dm_purchase_pattern.dm_purchase_pattern_occupation
go

create index dm_purchase_pattern_occupation
  on dm_purchase_pattern(occupation)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dm_purchase_pattern_interest'
   and object_id = object_id('dm_purchase_pattern'))
drop index dm_purchase_pattern.dm_purchase_pattern_interest
go

create index dm_purchase_pattern_interest
  on dm_purchase_pattern(interest)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dm_purchase_pattern_gender'
   and object_id = object_id('dm_purchase_pattern'))
drop index dm_purchase_pattern.dm_purchase_pattern_gender
go

create index dm_purchase_pattern_gender
  on dm_purchase_pattern(gender)
  on dds_fg6
go

