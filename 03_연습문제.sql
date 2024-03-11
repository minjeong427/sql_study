--1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
select 
    EMPLOYEE_ID,
    FIRST_NAME,
    HIRE_DATE,
    SALARY
from employees;

--2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME AS name
FROM employees;

--3. 50�� �μ� ����� ��� ������ ����ϼ���.
select *
from employees
where DEPARTMENT_ID = 50;

--4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT 
    FIRST_NAME,
    DEPARTMENT_ID,
    job_id
FROM employees
where DEPARTMENT_ID = 50;

--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT 
    FIRST_NAME,
    SALARY,
    SALARY + 300 AS �λ�ȱ޿�
FROM employees;

--6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT 
    FIRST_NAME AS �̸�,
    SALARY AS �޿�
FROM employees
where salary > 10000;

--7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
select
    first_name, 
    job_id,
    commission_pct
from employees
where commission_pct is not null;
    
--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
select 
    first_name, 
    hire_date, 
    salary
from employees
where hire_date between '03/01/01' and '03/12/31';

--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
select 
    first_name, 
    hire_date, 
    salary
from employees
where hire_date like '03%';

--10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� ����ϼ���.
select 
    first_name,
    salary
from employees
order by salary desc;

--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
select 
    first_name,
    salary
from employees
where department_id = 60
order by salary desc;

--12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
select
    first_name,
    job_id
from employees
where job_id = 'IT_PROG' 
OR job_id = 'SA_MAN';

select
    first_name,
    job_id
from employees
where job_id in ('IT_PROG', 'SA_MAN');

--13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
SELECT
    first_name || ' ' || last_name || ' ����� �޿���' || salary|| '�޷� �Դϴ�.' as test
FROM employees
WHERE first_name = 'Steven' 
AND last_name = 'King';

--14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
select
    first_name, job_id
from employees
where job_id like '%MAN';


--15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
select
    first_name, job_id
from employees
where job_id like '%MAN'
order by job_id;

