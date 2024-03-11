
-- ����Ŭ�� �� �� �ּ�

/*
���� �� �ּ�
*/

-- SELECT [�÷���(���� �� ����)] FROM [���̺� �̸�]
SELECT * FROM employees;

select 
    employee_id, 
    first_name, 
    last_name
from 
    employees;
    
select email, phone_number, hire_date
from employees;

-- �÷��� ��ȸ�ϴ� ��ġ���� * / + - ������ �����մϴ�.
select
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 as ����������
from employees;

-- NULL ���� Ȯ�� (���� 0�̳� ������� �ٸ� �����Դϴ�.)
select department_id, commission_pct
from employees;

-- alias (�÷���, ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
select
    first_name as �̸�,
    last_name as ��,
    salary as �޿�
from employees;

/*
����Ŭ�� Ȭ����ǥ('')�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ��
ǥ���ϰ� �ʹٸ� ''�� 2�� �������� ���� �˴ϴ�.
���ڿ� ���� ��ȣ�� || �Դϴ�. ���ڿ��� ���� ������ ������� �ʽ��ϴ�.
*/
select
    first_name || ' ' || last_name || '''s salary is $' || salary as �޿�����
from employees;

--  DISTINCT(�ߺ� ���� ����)
select department_id from employees;
select distinct department_id from employees;

--ROWNUM, ROWID
-- (**�ο��: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ��ȯ)
-- (�ο���̵�: �����ͺ��̽� ���� ���� �ּҸ� ��ȯ)
select rownum, rowid, employee_id
from employees;



















