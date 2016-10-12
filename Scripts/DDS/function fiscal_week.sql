use dds
go

if object_id('fiscal_week') is not null
  drop function fiscal_week
go

create function fiscal_week (@date as datetime)
returns int
as
begin
  declare @year int, @cyear char(4), @fiscal_start_date datetime, @fiscal_week int
  set @year = datepart(yyyy, @date)
  set @cyear = convert(varchar, @year)
  -- Fiscal year starts on Sep 1.
  if @date >= convert(datetime, convert(varchar,@year)+'-09-01') -- after 9/1
    set @fiscal_start_date = convert(datetime, @cyear+'-09-01')
  else -- before 9/1
    set @fiscal_start_date = convert(datetime, convert(varchar,@year-1)+'-09-01')
  set @fiscal_week = ceiling((datediff(d, @fiscal_start_date, @date)+1)/7.0)
  if @fiscal_week = 53 set @fiscal_week = 52 -- for 8/31, last day in fiscal year
  return @fiscal_week
end
go