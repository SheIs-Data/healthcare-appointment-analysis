/*
USE healthcare_analytics;

SELECT
    COUNT(DISTINCT Neighbourhood) AS total_neighbourhoods
FROM appointments_raw;
*/

SELECT
    Neighbourhood,
    COUNT(*) AS total_appointments,
    SUM(`No-show` = 'Yes') AS no_shows,
    ROUND(
        SUM(`No-show` = 'Yes') / COUNT(*) * 100,
        2
    ) AS no_show_rate
FROM appointments_raw
GROUP BY Neighbourhood
ORDER BY no_show_rate DESC;