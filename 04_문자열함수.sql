
-- lower(�ҹ���), initcap(�ձ��ڸ� �빮��), upper(�빮��)
select * from dual;
/*
    dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
    ���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
    �Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
    ��� ����ڰ� ������ �� �ֽ��ϴ�.
*/
select 
    'abcDEF', lower('abcDEF'), initcap('abcDEF'), upper('abcDEF')
from dual;

select 
    last_name,
    lower(last_name),
    initcap(last_name),
    upper(last_name)
from employees;

select
    salary
from employees
where lower(last_name) = 'austin';

-- length(����), instr(���� ã��, ������ 0�� ��ȯ, ������ �ε��� ��)
select 
    'abcdef', length('abcdef'), instr('abcdef', 'b')
from dual;

select
    first_name,
    length(first_name),
    instr(first_name, 'a')
from employees;

-- substr(�ڸ� ���ڿ�, �����ε���, ����) 
-- substr(�ڸ� ���ڿ�, �����ε���) -> ���ڿ� ������ �ڸ�.
-- �ε��� 1���� ����
-- concat(���� ����)
select
    'abcdef' as ex,
    substr('abcdef', 2, 5),
    concat('abc', '123')
from dual;

select
    first_name,
    substr(first_name, 1, 3),
    concat(first_name, last_name)
from employees;

-- LPAD, RPAD (��, ������ ������ ���ڿ��� ä���)
select
    lpad('abc', 10, '*'),
    rpad('abc', 10, '*')
from dual;

-- LTRIM(), RTRIM(), TRIM()
-- TRIM() -> ���� ���� ����
-- LTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ����(���ʺ���)
-- RTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ����(�����ʺ���)
select 
    ltrim('javascript_java', 'java')
from dual;

select 
    rtrim('javascript_java', 'java')
from dual;

select trim('       java      ') from dual;

-- REPLACE(str, old, new)
select
    replace('My dream is a president', 'president', 'programmer')
from dual;

select
    replace(replace('My dream is a president', 'president', 'programmer'), ' ', '')
from dual;

select
    replace(concat('hello', 'world!'), '!', '?')
from dual;

-----------------------------------------------------------------------------
/*
���� 1.
EMPLOYEES ���̺��� �̸�, �Ի����� �÷����� ����(��Ī)�ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�. (CONCAT)
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�. (REPLACE)
*/
select 
    concat(first_name, last_name) as �̸�,
    replace(hire_date, '/', '') as �Ի�����
from employees
order by �̸�;


/*
���� 2.
EMPLOYEES ���̺��� phone_number�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� 
��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���. (CONCAT, SUBSTR ���)
*/
select
    concat('(02)', substr(phone_number, 5))
from employees;

/*
���� 3. 
EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� ���ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/
select 
    rpad(substr(first_name, 1, 3), length(first_name), '*') as name,
    lpad(salary, 10, '*')as salary
from employees
where lower(job_id) = 'it_prog';






