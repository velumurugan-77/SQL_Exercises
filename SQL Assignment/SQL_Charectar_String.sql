-- // String functions or character based functions

select lower('Data Enganeer') lname from dual;
select  upper('velumurugan') uname from dual;
select length('velumurugan data enganeer')  length from dual;
select initcap('data enganeer') init_name from dual;
select trim ('  velumurugan  ') trim_name from dual;
select ltrim ('  velu') ltrim from dual;
select rtrim ('  velu  ') rtrim from dual;
select lpad('velumurugan','23','**') lpad from dual;
select rpad('velumurugan','18','**') rpad from dual;
select replace('velu murugan','murugan','mohan') replace from dual;