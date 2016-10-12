use NDS

set identity_insert division on
insert into division
( division_key, division_code, division_name
, source_system_code, create_timestamp, update_timestamp )
values
( 0, 'UN', 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert division off

set identity_insert region on
insert into region 
( region_key, region_code, region_name, division_key
, source_system_code, create_timestamp, update_timestamp )
values
( 0, 'UN', 'Unknown', 0
, 0, '1900-01-01', '1900-01-01' )
set identity_insert region off

set identity_insert city on
insert into city
( city_key, city_name, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 0
, '1900-01-01', '1900-01-01' )
set identity_insert city off

set identity_insert state on
insert into state
( state_key, state_code, state_name, formal_name
, admission_to_statehood, population
, capital, largest_city, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'UN', 'Unknown', 'Unknown'
, '1900-01-01', 0
, 'Unknown', 'Unknown', 0
, '1900-01-01', '1900-01-01' )
set identity_insert state off

set identity_insert country on
insert into country
( country_key, country_code, country_name, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'UN', 'Unknown', 0
, '1900-01-01', '1900-01-01' )
set identity_insert country off

set identity_insert address on
insert into address
( address_key, address1, address2, address3, address4
, city_key, post_code, state_key, country_key
, source_system_code, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown'
, 0, 'Unknown', 0, 0
, 0, '1900-01-01', '1900-01-01' )
set identity_insert address off

set identity_insert phone_number on
insert into phone_number
( phone_number_key, phone_number, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 0
, '1900-01-01', '1900-01-01' )
set identity_insert phone_number off

set identity_insert store_type on
insert into store_type
( store_type_key, store_type, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 0
, '1900-01-01', '1900-01-01')
set identity_insert store_type off

set identity_insert store on
insert into store
( store_key, store_number, store_name, store_type_key
, address_key, phone_number_key, web_site, region_key
, source_system_code, create_timestamp, update_timestamp )
values
( 0, 0, 'Unknown', 0
, 0, 0, 'Unknown', 0
, 0, '1900-01-01', '1900-01-01')
set identity_insert store off

set identity_insert customer_type on
insert into customer_type
( customer_type_key, customer_type_code, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, 'U', 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert customer_type off

set identity_insert customer_status on
insert into customer_status
( customer_status_key, customer_status_code, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, 0, 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert customer_status off

set identity_insert occupation on
insert into occupation
( occupation_key, occupation_code, occupation
, description, category
, source_system_code, create_timestamp, update_timestamp )
values
( 0, -1, 'Unknown', 'Unknown', 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert occupation off

set identity_insert household_income on
insert into household_income
( household_income_key, household_income_code
, lower_limit, upper_limit, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, 0, -1, -1, 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert household_income off

set identity_insert permission on
insert into permission
( permission_key, permission_code, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, '', 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert permission off

set identity_insert subscriber_band on
insert into subscriber_band
( subscriber_band_key, band_code
, lower_limit, upper_limit, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, '', -2, -1, 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert subscriber_band off

set identity_insert subscriber_class on
insert into subscriber_class
( subscriber_class_key, class_code
, lower_limit, upper_limit, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, '', -2, -1, 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert subscriber_class off

set identity_insert email_address on
insert into email_address 
( email_address_key, email_address, source_system_code
, create_timestamp, update_timestamp )
values
( 0, '', 0
, '1900-01-01', '1900-01-01' )
set identity_insert email_address off

set identity_insert channel on
insert into channel
( channel_key, name, description, start_date
, end_date, status, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 'Unknown', '1900-01-01'
, '1900-01-01', 'Unknown', 0
, '1900-01-01', '1900-01-01' )
set identity_insert channel off

set identity_insert interest on
insert into interest
( interest_key, interest, description
, interest_group, associated_product_type
, related_interest_key, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 'Unknown'
, 'Unknown', 'Unknown'
, 0, 0
, '1900-01-01', '1900-01-01' )
set identity_insert interest off

set identity_insert email_address_type on
insert into email_address_type
( email_address_type_key, email_address_type_code
, email_address_type, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, ''
, 'Unknown', 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert email_address_type off

set identity_insert phone_number_type on
insert into phone_number_type
( phone_number_type_key, phone_number_type_code
, phone_number_type, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, ''
, 'Unknown', 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert phone_number_type off

set identity_insert address_type on
insert into address_type
( address_type_key, address_type_code
, address_type, description
, source_system_code, create_timestamp, update_timestamp )
values
( 0, ''
, 'Unknown', 'Unknown'
, 0, '1900-01-01', '1900-01-01' )
set identity_insert address_type off

set identity_insert customer on
insert into customer
( customer_key, customer_id, account_number, customer_type_key
, name, gender, date_of_birth, occupation_key, household_income_key
, date_registered, customer_status_key, subscriber_class_key
, subscriber_band_key, permission_key, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 0, 0, 0
, 'Unknown', '', '1900-01-01', 0, 0
, '1900-01-01', 0, 0
, 0, 0, 0
, '1900-01-01', '1900-01-01' )
set identity_insert customer off

select * from stage.dbo.store
select * from store
select * from store_type
select * from phone_number
select * from city
select * from address
select * from customer_type
select * from customer_status
select * from occupation
select * from household_income
select * from permission
select * from subscriber_band
select * from subscriber_class
select * from email_address 
select * from channel
select * from interest
select * from email_address_type
select * from phone_number_type
select * from address_type
select * from stage.dbo.customer
select * from customer

delete from store where store_key <> 0
delete from store_type where store_type_key <> 0
delete from phone_number where phone_number_key <> 0
delete from city where city_key <> 0
delete from address where address_key <> 0
delete from customer_type where customer_type_key <> 0
delete from customer_status where customer_status_key <> 0
delete from occupation where occupation_key <> 0
delete from household_income where household_income_key <> 0
delete from permission where permission_key <> 0
delete from subscriber_band where subscriber_band_key <> 0
delete from subscriber_class where subscriber_band_key <> 0
delete from email_address where email_address_key <> 0
delete from phone_number where phone_number_key <> 0
delete from channel where channel_key <> 0
delete from interest where interest_key <> 0
delete from email_address_type where email_address_type_key <> 0
delete from phone_number_type where phone_number_type_key <> 0
delete from address_type where address_type_key <> 0
delete from customer where customer_key <> 0

insert into nds.dbo.store_type 
( store_type, source_system_code
, create_timestamp, update_timestamp)
select 
  distinct s.store_type as store_type
, 1 as source_system_code
, getdate() as create_timestamp
, getdate() as update_timestamp
from stage.dbo.store s
where not exists
( select * from nds.dbo.store_type t
  where t.store_type = s.store_type )

insert into nds.dbo.phone_number
( phone_number, source_system_code
, create_timestamp, update_timestamp)
select 
  distinct s.phone_number as phone_number
, 1 as source_system_code
, getdate() as create_timestamp
, getdate() as update_timestamp
from stage.dbo.store s
where not exists
( select * from nds.dbo.phone_number p
  where p.phone_number = s.phone_number )

insert into city
( city_name, source_system_code
, create_timestamp, update_timestamp )
select 
  distinct s.city as city_name
, 1 as source_system_code
, getdate() as create_timestamp
, getdate() as update_timestamp
from stage.dbo.store s
where not exists
( select * from nds.dbo.city c
  where c.city_name = s.city )

insert into nds.dbo.address
( address1, address2, address3, address4
, city_key, post_code, state_key, country_key 
, source_system_code, create_timestamp, update_timestamp)
select
  distinct s.address1, s.address2, s.address3, s.address4
, c.city_key, s.zipcode, st.state_key, co.country_key
, 1 as source_system_code
, getdate() as create_timestamp
, getdate() as update_timestamp
from stage.dbo.store s
left join nds.dbo.city c
  on s.city = c.city_name
left join nds.dbo.state st
  on case when s.state = 'N/A' then 'Unknown' else s.state end = st.state_name
left join nds.dbo.country co
  on s.country = co.country_code
where not exists
( select * from nds.dbo.address a
  where coalesce(a.address1,'') = coalesce(s.address1,'')
  and   coalesce(a.address2,'') = coalesce(s.address2,'')
  and   coalesce(a.address3,'') = coalesce(s.address3,'')
  and   coalesce(a.address4,'') = coalesce(s.address4,'')
  and   coalesce(a.city_key,0) = coalesce(c.city_key,0)
  and   coalesce(a.post_code,'') = coalesce(s.zipcode,'')
  and   coalesce(a.state_key,0) = coalesce(st.state_key,0)
  and   coalesce(a.country_key,0) = coalesce(co.country_key,0) )

insert into nds.dbo.store
( store_number, store_name, store_type_key
, address_key, phone_number_key, web_site, region_key
, source_system_code, create_timestamp, update_timestamp )
select 
  s.store_number as store_number
, s.store_name as store_name
, t.store_type_key as store_type_key
, z.address_key as address_key
, p.phone_number_key as phone_number_key
, s.web_site as web_site
, r.region_key as region_key
, 1 as source_system_code
, getdate() as created_timestamp
, getdate() as update_timestamp
from stage.dbo.store s
inner join nds.dbo.store_type t
  on s.store_type = t.store_type
inner join 
  (select a.address_key, a.address1, a.address2, a.address3, a.address4, a.post_code as zipcode
   , c.city_name as city, st.state_name as state, upper(co.country_code) as country
   from address a
   inner join city c on a.city_key = c.city_key
   inner join state st on a.state_key = st.state_key
   inner join country co on a.country_key = co.country_key
  ) z
  on coalesce(s.address1,'') = coalesce(z.address1,'')
 and coalesce(s.address2,'') = coalesce(z.address2,'')
 and coalesce(s.address3,'') = coalesce(z.address3,'')
 and coalesce(s.address4,'') = coalesce(z.address4,'')
 and coalesce(s.zipcode,'') = coalesce(z.zipcode,'')
 and coalesce(s.city,'') = coalesce(z.city,'')
 and coalesce(case when s.state = 'N/A' then 'Unknown' else s.state end,'') = coalesce(z.state,'')
 and coalesce(s.country,'') = coalesce(z.country,'')
inner join nds.dbo.phone_number p
  on s.phone_number = p.phone_number
inner join nds.dbo.region r
  on s.region = r.region_name
where not exists
( select * from nds.dbo.store n
  where n.store_number = s.store_number )

update nds.dbo.store 
set store_name = s.store_name
, store_type_key = st.store_type_key
, address_key = a.address_key
, phone_number_key = pn.phone_number_key
, region_key = r.region_key
, web_site = s.web_site
, update_timestamp = getdate()
from stage.dbo.store s
inner join nds.dbo.store n
  on s.store_number = n.store_number
inner join nds.dbo.store_type st
  on n.store_type_key = st.store_type_key
inner join nds.dbo.address a
  on n.address_key = a.address_key
inner join nds.dbo.phone_number pn
  on n.phone_number_key = pn.phone_number_key
inner join nds.dbo.region r
  on n.region_key = r.region_key
inner join nds.dbo.city c
  on a.city_key = c.city_key
inner join nds.dbo.state sta
  on a.state_key = sta.state_key
inner join nds.dbo.country co
  on a.country_key = co.country_key
where coalesce(s.store_name,'') <> coalesce(n.store_name,'')
or coalesce(s.store_type,'') <> coalesce(st.store_type,'')
or coalesce(s.address1,'') <> coalesce(a.address1,'')
or coalesce(s.address2,'') <> coalesce(a.address2,'')
or coalesce(s.address3,'') <> coalesce(a.address3,'')
or coalesce(s.address4,'') <> coalesce(a.address4,'')
or coalesce(a.city_key,0) <> coalesce(c.city_key,0)
or coalesce(a.post_code,'') <> coalesce(s.zipcode,'')
or coalesce(a.state_key,0) <> coalesce(sta.state_key,0)
or coalesce(a.country_key,0) <> coalesce(co.country_key,0) 
or coalesce(s.phone_number,'') <> coalesce(pn.phone_number,'')
or coalesce(s.web_site,'') <> coalesce(n.web_site,'')

insert into nds.dbo.email_address
( email_address, source_system_code
, create_timestamp, update_timestamp )
select distinct c.email_address 
, 1 as source_system_code
, getdate() as create_timestamp
, getdate() as update_timestamp
from stage.dbo.customer c
where not exists
( select * from nds.dbo.email_address e
  where e.email_address = c.email_address )

insert into nds.dbo.phone_number
( phone_number, source_system_code
, create_timestamp, update_timestamp)
select 
  distinct c.phone_number as phone_number
, 1 as source_system_code
, getdate() as create_timestamp
, getdate() as update_timestamp
from stage.dbo.customer c
where not exists
( select * from nds.dbo.phone_number p
  where p.phone_number = c.phone_number )

insert into nds.dbo.address
( address1, address2, address3, address4
, city_key, post_code, state_key, country_key 
, source_system_code, create_timestamp, update_timestamp)
select
  distinct s.address1, s.address2, s.address3, s.address4
, c.city_key, s.zipcode, st.state_key, co.country_key
, 1 as source_system_code
, getdate() as create_timestamp
, getdate() as update_timestamp
from stage.dbo.customer s
left join nds.dbo.city c
  on s.city = c.city_name
left join nds.dbo.state st
  on case when s.state = 'N/A' then 'Unknown' else s.state end = st.state_name
left join nds.dbo.country co
  on s.country = co.country_code
where not exists
( select * from nds.dbo.address a
  where coalesce(a.address1,'') = coalesce(s.address1,'')
  and   coalesce(a.address2,'') = coalesce(s.address2,'')
  and   coalesce(a.address3,'') = coalesce(s.address3,'')
  and   coalesce(a.address4,'') = coalesce(s.address4,'')
  and   coalesce(a.city_key,0) = coalesce(c.city_key,0)
  and   coalesce(a.post_code,'') = coalesce(s.zipcode,'')
  and   coalesce(a.state_key,0) = coalesce(st.state_key,0)
  and   coalesce(a.country_key,0) = coalesce(co.country_key,0) )
