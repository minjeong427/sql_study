
-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT

-- �׷�ȭ�� ���� �������� ������ �׷��� ���̺� ��ü�� �˴ϴ�.
SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;


SELECT COUNT(*) FROM employees; -- �� �� �������� ��
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; -- null�� �ƴ� ���� ��
SELECT COUNT(manager_id) FROM employees; -- null�� �ƴ� ���� ��

SELECT * FROM employees;


-- �μ����� �׷�ȭ, �׷� �Լ��� ���
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;


-- ������ ��
-- �׷� �Լ��� �ܵ������� ���� ���� ��ü ���̺��� �׷��� ����� ������
-- �Ϲ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ�. �ݵ�� �׷��� �ʿ��մϴ�.
SELECT
    department_id,
    AVG(salary)
FROM employees; -- ERROR


-- GROUP BY���� ����� �� GROUP���� ������ ���� �÷��� ��ȸ�� �� �����ϴ�.
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- ERROR 

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id;

-- GROUP BY�� ���� �׷�ȭ�� �� ������ �� ��� HAVING�� ���.
-- WHERE�� �Ϲ� ������. GROUP BY���� ���� ����˴ϴ�.
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 10000;

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

-- �μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� �޿� ����� 5000 �̻� ��ȸ
SELECT
    department_id,
    AVG(salary) AS ���
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY ��� desc;

/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
select
    job_id,
    count(*),
    avg(salary) as ��տ���
from employees
group by job_id
order by ��տ��� desc;


/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/
select
    to_char(hire_date, 'YYYY') as �Ի�⵵,
    count(*) as �����
from employees
group by to_char(hire_date, 'YYYY')
ORDER BY �Ի�⵵;


/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/
select
    department_id,
    avg(salary)AS ���
from employees
where salary >= 5000
group by department_id
having avg(salary) > 7000;
    

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/
select
    department_id,
    trunc(avg(salary + salary*commission_pct), 2) as avg_salary,
    sum(salary + salary*commission_pct) as sum,
    count(*)
from employees
where commission_pct is not null
group by department_id;

























