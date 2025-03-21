--##########sysdate functions#####

 --select sysdate from dual;
  --select systimestamp from dual;
 -- select dbtimezone from dual;
 -- select sysdate,sysdate+7 next_week from dual;
 -- select sysdate, sysdate-14 previous_week from dual;

 -- ***systimestamp functions ----INTERVAL---- ***
 
 select systimestamp,systimestamp+interval '3'
 hour hours from dual;
  select systimestamp,systimestamp+interval '5'
 minute minuts from dual;
  select systimestamp,systimestamp+interval '35'
 second  seconds from dual;
 select systimestamp,systimestamp+interval '3'
 year years from dual;
 select systimestamp,systimestamp+interval '8'
 month months from dual;
 select systimestamp,systimestamp+interval '8'
 day days from dual;

--- *********extract****
select sysdate,extract(year from sysdate)years,
  extract(month from sysdate)monts,
  extract(day from sysdate)days from dual;


select sysdate,last_day(sysdate)  last_date from dual;

select sysdate, next_day(sysdate ,'monday')
next_date from dual;

select to_char(sysdate,'day') from dual;


-- **** NULL based functions and COALESCE ****

 select null from dual;
 select  'data' from dual;
 select nvl(null,30) from dual;
select nvl2(expression,value if not null,value if null) from dual;
 select nvl2(null,15,10) from dual;
 select coalesce(null,null,2220,0) from dual;
 select coalesce(hire_date,sysdate) from hr.EMPLOYEES;
  --if hire_date available it will be used or else sysdate will used
  select coalesce(commision,bonus,0) from hr.employees;
 --commission not null as it is, bonus not null as it is, if null 0 will be replaced.
