
-- 그룹 함수 AVG, MAX, MIN, SUM, COUNT

-- 그룹화를 따로 지정하지 않으면 그룹은 테이블 전체가 됩니다.
SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;


SELECT COUNT(*) FROM employees; -- 총 행 데이터의 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; -- null이 아닌 행의 수
SELECT COUNT(manager_id) FROM employees; -- null이 아닌 행의 수

SELECT * FROM employees;


-- 부서별로 그룹화, 그룹 함수의 사용
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;


-- 주의할 점
-- 그룹 함수는 단독적으로 사용될 때는 전체 테이블이 그룹의 대상이 되지만
-- 일반 컬럼과 동시에 그냥 출력할 수는 없습니다. 반드시 그룹이 필요합니다.
SELECT
    department_id,
    AVG(salary)
FROM employees; -- ERROR


-- GROUP BY절을 사용할 때 GROUP절에 묶이지 않은 컬럼은 조회할 수 없습니다.
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

-- GROUP BY를 통해 그룹화할 때 조건을 걸 경우 HAVING을 사용.
-- WHERE은 일반 조건절. GROUP BY보다 먼저 진행됩니다.
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

-- 부서 아이디가 50 이상인 것들을 그룹화 시키고, 그룹 급여 평균이 5000 이상만 조회
SELECT
    department_id,
    AVG(salary) AS 평균
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY 평균 desc;

/*
문제 1.
1-1. 사원 테이블에서 JOB_ID별 사원 수를 구하세요.
1-2. 사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요.
*/
select
    job_id,
    count(*),
    avg(salary) as 평균월급
from employees
group by job_id
order by 평균월급 desc;


/*
문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.
(TO_CHAR() 함수를 사용해서 연도만 변환합니다. 그리고 그것을 그룹화 합니다.)
*/
select
    to_char(hire_date, 'YYYY') as 입사년도,
    count(*) as 사원수
from employees
group by to_char(hire_date, 'YYYY')
ORDER BY 입사년도;


/*
문제 3.
급여가 5000 이상인 사원들의 부서별 평균 급여를 출력하세요. 
단 부서 평균 급여가 7000이상인 부서만 출력하세요.
*/
select
    department_id,
    avg(salary)AS 평균
from employees
where salary >= 5000
group by department_id
having avg(salary) > 7000;
    

/*
문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
*/
select
    department_id,
    trunc(avg(salary + salary*commission_pct), 2) as avg_salary,
    sum(salary + salary*commission_pct) as sum,
    count(*)
from employees
where commission_pct is not null
group by department_id;

























