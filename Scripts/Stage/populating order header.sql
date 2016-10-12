truncate table stage.dbo.order_header

update meta.dbo.data_flow set LSET = getdate()-2, CET = getdate()-1 where name = 'order_header'

select * from meta.dbo.data_flow

select * from jade.dbo.order_header 
where (created between getdate()-1 and getdate()) 
or (last_updated between getdate()-1 and getdate())

select * from meta.dbo.data_flow

select * from stage.dbo.order_header