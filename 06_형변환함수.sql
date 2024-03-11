
-- ����ȯ �Լ� TO_CHAR, TO_NUMBER, TO_DATE

-- ��¥�� ���ڷ� TO_CHAR(��, ����)
-- ��¥�� ���ڷ� �� ��ȯ�� �� ���ϴ� �������� ��¥�� ǥ���� �� �ֽ��ϴ�.
SELECT TO_CHAR(sysdate) from dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DY PM HH:MI:SS') from dual;
SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:SS') from dual;

-- ���Ĺ��ڿ� �԰� ����ϰ� ���� ���ڸ� ""�� ���μ� �����մϴ�.
SELECT
    TO_CHAR(sysdate, 'YYYY"��" MM"��" DD"��" DY"����" HH24"��" MI"��" SS"��"')
FROM dual;

-- ���ڸ� ���ڷ� TO_CHAR(��, ����)
-- ���Ŀ��� ����ϴ� '9'�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ� ���� ��ȣ�Դϴ�.
SELECT TO_CHAR(20000, '99,999') FROM dual;
SELECT TO_CHAR(20000, 'L99,999') FROM dual;
SELECT TO_CHAR(20000.29, '99999.9') FROM dual; -- �ݿø��� ����.

select
    first_name,
    to_char(salary, '$99,999') as salary
from employees;

-- ���ڸ� ���ڷ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM DUAL; -- �ڵ� �� ��ȯ(����->����)
SELECT TO_NUMBER('2000') + 2000 FROM DUAL; -- ����� �� ��ȯ
SELECT '$3,300' + 2000 FROM DUAL; -- ERROR
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM DUAL;

-- ���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��, ����)
SELECT TO_DATE('2023-04-13')FROM DUAL;

-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�. �Ϻθ� ��ȯ�� �� �����ϴ�.
SELECT TO_DATE('2021-03-31 12:23:50', 'YY-MM-DD HH:MI:SS') FROM DUAL;

SELECT TO_DATE('2024�� 02�� 12��', 'YYYY"��" MM"��" DD"��"') FROM DUAL;

-- XXXX�� XX�� XX�� -> ���ڿ� �������� ��ȯ�� ������.
-- ��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�. dual���� ��ȸ�ϼ���.
SELECT '20050102' FROM DUAL;

SELECT 
    TO_CHAR
        (TO_DATE('20050102', 'YYYYMMDD'), 
        'YYYY"��" MM"��" DD"��"'
        ) AS DATEINFO
FROM DUAL;

---------------------------------------------------------------------

-- NULL ���¸� ��ȭ�ϴ� �Լ� NVL(�÷�, ��ȯ�� Ÿ�ٰ�)
SELECT 
    first_name,
    NVL(commission_pct, 0) as comm_pct
FROM employees;

-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL2(�÷�, null�� �ƴ� ����� ��, null�� ����� ��)
select 
    first_name,
    salary,
    NVL2(commission_pct, salary + (salary * commission_pct), salary
         ) as real_salary
from employees;

-- null�� ������ ���� �ʽ��ϴ�.
select 
    first_name,
    salary,
    salary + (salary * commission_pct)
from employees;

-- DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2, ...... , default)
-- ����Ŭ ���� �Լ�. ���� �񱳸� ����.
select
    first_name,
    job_id,
    salary,
    DECODE(
        job_id,
        'IT_PROG', salary*1.1,
        'FI_MGR', salary*1.2,
        'AD_VP', salary*1.3,
        salary
    ) as result
from employees;

-- CASE WHEN THEN END
-- ANSI ǥ�� ����
select
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGR' THEN salary*1.2
        WHEN 'AD_VP' THEN salary*1.3
        WHEN 'FI_ACCOUNT' THEN salary*1.4
        ELSE salary
    END) AS result
from employees;

/*
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/
select
    employee_id as �����ȣ,
    first_name as �̸�,
    hire_date as �Ի�����,
    trunc((sysdate - hire_date) / 365) as �ټӳ��
from employees
where (sysdate - hire_date) / 365 >= 17
order by �ټӳ�� desc;

/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/

select
    first_name,
    manager_id,
    case manager_id
        when 100 then '���'
        when 120 then '����'
        when 121 then '�븮'
        when 122 then '����'
        else '�ӿ�'
    end as ����
from employees
where department_id = 50;



















