use dds
go

if object_id('fiscal_period') is not null
  drop function fiscal_period
go

create function fiscal_period (@fiscal_week as int)
returns char(4)
as
begin
  declare @fiscal_period char(4)
  -- Determine fiscal period based on 454 454 454 454 pattern.
  if @fiscal_week >= 1 and @fiscal_week <= 4 
    set @fiscal_period = 'FP1'
  if @fiscal_week >= 5 and @fiscal_week <= 9 
    set @fiscal_period = 'FP2'
  if @fiscal_week >= 10 and @fiscal_week <= 13
    set @fiscal_period = 'FP3'
  if @fiscal_week >= 14 and @fiscal_week <= 17 
    set @fiscal_period = 'FP4'
  if @fiscal_week >= 18 and @fiscal_week <= 22
    set @fiscal_period = 'FP5'
  if @fiscal_week >= 23 and @fiscal_week <= 26
    set @fiscal_period = 'FP6'
  if @fiscal_week >= 27 and @fiscal_week <= 30
    set @fiscal_period = 'FP7'
  if @fiscal_week >= 31 and @fiscal_week <= 35
    set @fiscal_period = 'FP8'
  if @fiscal_week >= 36 and @fiscal_week <= 39
    set @fiscal_period = 'FP9'
  if @fiscal_week >= 40 and @fiscal_week <= 43
    set @fiscal_period = 'FP10'
  if @fiscal_week >= 44 and @fiscal_week <= 47
    set @fiscal_period = 'FP11'
  if @fiscal_week >= 48 and @fiscal_week <= 52
    set @fiscal_period = 'FP12'
  return @fiscal_period
end
go