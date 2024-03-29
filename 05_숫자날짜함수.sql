
-- 숫자함수
-- ROUND(반올림)
-- 원하는 반올림 위치를 매개값으로 지정. 음수를 주는 것도 가능.
select 
    round(3.1415, 3), round(45.923, 0), round(45.923, -1)
from dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수까지 잘라냅니다.
select 
    trunc(3.1415, 3), trunc(45.923, 0), trunc(45.923, -1)
from dual;

-- ABS (절대값)
select abs(-34) from dual;

-- CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(나머지 나눗셈 연산)
SELECT
    10 / 4, MOD(10, 4)
FROM DUAL;

--------------------------------------------------------------------------

-- 날짜 함수
-- sysdate: 컴퓨터의 현재 날짜, 시간 정보를 가져와서 제공하는 함수 -> 시간 정보도 있음!
select sysdate from dual; --> 시간정보 보려면 환경설정에서 NLS 들어가서 바꾸면 됨.
select systimestamp from dual; --> 밀리초, 표준시까지 제공

-- 날짜도 연산이 가능합니다.
select sysdate + 1 from dual; -- 일자 덧셈 연산이 가능.

-- 날짜 타입과 날짜 타입은 뺄셈 연산을 지원합니다.
-- 덧셈은 허용하지 않습니다.
select 
    first_name, sysdate - hire_date
from employees; -- 일수

select
    first_name, 
    (sysdate - hire_date) / 7 as week
from employees; -- 주수

select
    first_name,
    (sysdate - hire_date) / 365 as year
from employees; -- 년수

-- 날짜 반올림, 절사
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; -- 년 기준으로 반올림
select round(sysdate, 'month') from dual; -- 월 기준으로 반올림
select round(sysdate, 'day') from dual; -- 주 기준으로 반올림(해당 주의 일요일 날짜)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; -- 년 기준으로 절사
select trunc(sysdate, 'month') from dual; -- 월 기준으로 절사
select trunc(sysdate, 'day') from dual; -- 주 기준으로 절사(해당 주의 일요일 날짜)
























