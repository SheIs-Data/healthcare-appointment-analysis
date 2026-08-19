/*
USE healthcare_analytics;

SELECT
    PatientId,
    COUNT(*) AS appointment_count
FROM appointments_raw
GROUP BY PatientId
HAVING COUNT(*) > 1
ORDER BY appointment_count DESC;
*/

USE healthcare_analytics;

SELECT
    CASE
        WHEN patient_appointments = 1 THEN 'One-Time Patient'
        ELSE 'Repeat Patient'
    END AS patient_type,
    
    COUNT(*) AS total_appointments,
    
    SUM(no_shows) AS no_shows,
    
    ROUND(
        SUM(no_shows) / COUNT(*) * 100,
        2
    ) AS no_show_rate

FROM (
    SELECT
        PatientId,
        COUNT(*) AS patient_appointments,
        SUM(`No-show` = 'Yes') AS no_shows
    FROM appointments_raw
    GROUP BY PatientId
) AS patient_summary

GROUP BY patient_type;