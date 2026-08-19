-- Do males or females have a higher number of missed appointments?
USE healthcare_analytics;
/*
SELECT
    Gender,
    `No-show`,
    COUNT(*) AS total
FROM appointments_raw
GROUP BY Gender, `No-show`
ORDER BY Gender, `No-show`;
*/

/* to know which gender has the higher percentage of missed appointments, which is more meaningful for analysis.
*/
/*
USE healthcare_analytics;

SELECT
    Gender,
    COUNT(*) AS total_appointments,
    SUM(`No-show` = 'Yes') AS no_shows,
    ROUND(
        SUM(`No-show` = 'Yes') / COUNT(*) * 100,
        2
    ) AS no_show_rate
FROM appointments_raw
GROUP BY Gender
ORDER BY no_show_rate DESC;
*/

/* the above query says Female appointments had a slightly higher no-show rate than male appointments (20.31% vs. 19.97%), although the difference was small.
*/
