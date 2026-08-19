/*
SELECT
    CASE
        WHEN Age BETWEEN 0 AND 12 THEN '0-12'
        WHEN Age BETWEEN 13 AND 19 THEN '13-19'
        WHEN Age BETWEEN 20 AND 39 THEN '20-39'
        WHEN Age BETWEEN 40 AND 59 THEN '40-59'
        WHEN Age BETWEEN 60 AND 79 THEN '60-79'
        WHEN Age >= 80 THEN '80+'
    END AS age_group,
    COUNT(*) AS total
FROM appointments_raw
WHERE Age >= 0
GROUP BY age_group
ORDER BY
    MIN(Age);
*/

-- the query below shows no_show_rate_by_age_group
USE healthcare_analytics;

SELECT
    CASE
        WHEN Age BETWEEN 0 AND 12 THEN '0-12'
        WHEN Age BETWEEN 13 AND 19 THEN '13-19'
        WHEN Age BETWEEN 20 AND 39 THEN '20-39'
        WHEN Age BETWEEN 40 AND 59 THEN '40-59'
        WHEN Age BETWEEN 60 AND 79 THEN '60-79'
        WHEN Age >= 80 THEN '80+'
    END AS age_group,

    COUNT(*) AS total_appointments,

    SUM(`No-show` = 'Yes') AS no_shows,

    ROUND(
        SUM(`No-show` = 'Yes') / COUNT(*) * 100,
        2
    ) AS no_show_rate

FROM appointments_raw

WHERE Age >= 0

GROUP BY age_group

ORDER BY no_show_rate DESC;    