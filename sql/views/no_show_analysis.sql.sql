-- Do males or females have a higher number of missed appointments?
USE healthcare_analytics;

SELECT
    Gender,
    `No-show`,
    COUNT(*) AS total
FROM appointments_raw
GROUP BY Gender, `No-show`
ORDER BY Gender, `No-show`;