-- 1. Count & Pct of F vs M that have OCD & Average Obession Score by Gender
with data as (
SELECT
Gender,
count('Patient ID') as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM health_data.ocd_patient_dataset
Group By 1
Order by 2
)
select

sum(case when Gender = 'Female' then patient_count else 0 end) as count_female,
sum(case when Gender = 'Male' then patient_count else 0 end) as count_male,

sum(case when Gender = 'Female' then patient_count else 0 end)/
(sum(case when Gender = 'Female' then patient_count else 0 end) +sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2
as pct_female,

sum(case when Gender = 'Male' then patient_count else 0 end)/
(sum(case when Gender = 'Female' then patient_count else 0 end) +sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2
as pct_male


from data
;

-- 2. Count of Patients by Ethnicity and their respective Average Obsession Score
select Ethnicity,
count('Patient ID') as patient_count,
avg(`Y-BOCS Score (Obsessions)`) as obs_score
FROM health_data.ocd_patient_dataset
Group by 1
Order by 2;



-- 3. Number of people diagnosed with OCD MoM
-- alter table health_data.ocd_patient_dataset
-- modify `OCD Diagnosis Date` date; 
select
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
-- `OCD Diagnosis Date`
count(`Patient ID`) patient_count
from health_data.ocd_patient_dataset
group by 1
Order by 1
;
-- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score 
select 
`Obsession Type`,
count('Patient ID') as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from health_data.ocd_patient_dataset
group by 1
order by 1
;
-- 5. what is the most common Compulsion type (Count) & it's respective Average Obsession Score
select 
`Compulsion Type`,
count('Patient ID') as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from health_data.ocd_patient_dataset
group by 1
order by 1
;