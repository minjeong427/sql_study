
-- �����Լ�
-- ROUND(�ݿø�)
-- ���ϴ� �ݿø� ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����.
select 
    round(3.1415, 3), round(45.923, 0), round(45.923, -1)
from dual;

-- TRUNC(����)
-- ������ �Ҽ��� �ڸ������� �߶���ϴ�.
select 
    trunc(3.1415, 3), trunc(45.923, 0), trunc(45.923, -1)
from dual;

-- ABS (���밪)
select abs(-34) from dual;

-- CEIL(�ø�), FLOOR(����)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(������ ������ ����)
SELECT
    10 / 4, MOD(10, 4)
FROM DUAL;

--------------------------------------------------------------------------

-- ��¥ �Լ�
-- sysdate: ��ǻ���� ���� ��¥, �ð� ������ �����ͼ� �����ϴ� �Լ� -> �ð� ������ ����!
select sysdate from dual; --> �ð����� ������ ȯ�漳������ NLS ���� �ٲٸ� ��.
select systimestamp from dual; --> �и���, ǥ�ؽñ��� ����

-- ��¥�� ������ �����մϴ�.
select sysdate + 1 from dual; -- ���� ���� ������ ����.

-- ��¥ Ÿ�԰� ��¥ Ÿ���� ���� ������ �����մϴ�.
-- ������ ������� �ʽ��ϴ�.
select 
    first_name, sysdate - hire_date
from employees; -- �ϼ�

select
    first_name, 
    (sysdate - hire_date) / 7 as week
from employees; -- �ּ�

select
    first_name,
    (sysdate - hire_date) / 365 as year
from employees; -- ���

-- ��¥ �ݿø�, ����
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; -- �� �������� �ݿø�
select round(sysdate, 'month') from dual; -- �� �������� �ݿø�
select round(sysdate, 'day') from dual; -- �� �������� �ݿø�(�ش� ���� �Ͽ��� ��¥)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; -- �� �������� ����
select trunc(sysdate, 'month') from dual; -- �� �������� ����
select trunc(sysdate, 'day') from dual; -- �� �������� ����(�ش� ���� �Ͽ��� ��¥)
























