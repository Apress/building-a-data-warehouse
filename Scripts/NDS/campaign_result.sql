use NDS
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'campaign_result')
drop table campaign_result
go

-- Create the table:

create table campaign_result
( campaign_key            int not null 
, customer_key            int not null
, communication_key       int not null
, channel_key             int not null
, send_date               datetime
, delivery_status_key     int not null
, sent                    tinyint
, delivered               tinyint
, bounced                 tinyint
, opened                  tinyint
, clicked_through         tinyint
, complaint               tinyint
, spam_verdict            tinyint
, trap_hit                tinyint
, source_system_code      tinyint  not null
, create_timestamp        datetime not null
, update_timestamp        datetime not null
, constraint pk_campaign_result
  primary key clustered (customer_key, communication_key, channel_key)
  on nds_fg6
, constraint fk_campaign_result_campaign
  foreign key (campaign_key)
  references campaign(campaign_key)
, constraint fk_campaign_result_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_campaign_result_communication
  foreign key (communication_key)
  references communication(communication_key)
, constraint fk_campaign_result_channel
  foreign key (channel_key)
  references channel(channel_key)
, constraint fk_campaign_result_delivery_status
  foreign key (delivery_status_key)
  references delivery_status(delivery_status_key)
) on nds_fg4
go

