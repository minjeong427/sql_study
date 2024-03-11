-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

-- UNION -> �ߺ� �����͸� ������� ����.
select
    employee_id, first_name
from employees
where hire_date like '04%'
UNION
select
    employee_id, first_name
from employees
where department_id = 20;

-- UNION ALL -> �ߺ� �����͸� �����. 
select
    employee_id, first_name
from employees
where hire_date like '04%'
UNION ALL
select
    employee_id, first_name
from employees
where department_id = 20;

select
    employee_id, first_name
from employees
where hire_date like '04%'
INTERSECT
select
    employee_id, first_name
from employees
where department_id = 20;

select
    employee_id, first_name
from employees
where hire_date like '04%'
MINUS
select
    employee_id, first_name
from employees
where department_id = 20;

select
    employee_id, first_name
from employees
where department_id = 20
MINUS
select
    employee_id, first_name
from employees
where hire_date like '04%'





















