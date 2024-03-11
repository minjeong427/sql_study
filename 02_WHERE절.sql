
select * from employees;

-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
select first_name, last_name, job_id
from employees
where job_id = 'IT_PROG';

select *
from employees
where last_name = 'King';

select *
from employees
where department_id = '50';

select *
from employees
where salary >= 15000
and salary < 20000;

select *
from employees
where hire_date = '04/01/30';

-- 데이터의 행 제한 (BETWEEN, IN, LIKE)
select * from employees
where salary between 15000 and 20000;

select * from employees
where hire_date between '03/01/01' and '03/12/31';

-- IN 연산자의 사용 (특정 값들과 비교할 때 사용)
select * from employees
where manager_id in (100, 101, 102);

select * from employees
where job_id in ('IT_PROG', 'AD_VP');

-- LIKE 연산자 (지정 문자열 포함 여부)
-- %는 어떠한 문자든, _는 데이터의 자리(위치)를 표현할 때 사용
select first_name, last_name, hire_date
from employees
where hire_date like '03%';

select first_name, last_name, hire_date
from employees
where hire_date like '%15';

select first_name, last_name, hire_date
from employees
where hire_date like '%05%';

select first_name, last_name, hire_date
from employees
where hire_date like '___05%';

-- IS NULL (null 값을 찾음)
select * from employees
where commission_pct is null;

select * from employees
where commission_pct is not null;

-- AND, OR
-- AND가 OR보다 연산 순서가 빠름.
select * from employees
where job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

select * from employees
where (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

-- 데이터의 정렬 (SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC: ascending 오름차순 -> 생략 가능(기본값)
-- DESC: descending 내림차순
select * from employees
order by hire_date;

select * from employees
order by hire_date desc;

select * from employees
where job_id = 'IT_PROG'
order by first_name asc;

select * from employees
where salary >= 5000
order by employee_id desc;

select
    first_name,
    salary*12 as pay
from employees
order by pay asc;





















