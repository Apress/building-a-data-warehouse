/* Change request number: CR023
Date created: 12/14/2007
Created by: Vincent Rainardi
Description of change: Change the risk level of rule 8 from 1 to 2
Schedule for production implementation: 12/18/2007
*/

use meta -- use metadata database

-- Event Log section
insert into event_log (event_type, event_category, event_timestamp, object, dataflow, rows, note)
values (7, 3, getdate(), 371, 0, 8, 'update risk level from 1 to 2')

-- Rollback section
update dq_rules set risk_level = 1 where rule_key = 8

-- Implementation section
update dq_rules set risk_level = 2 where rule_key = 8