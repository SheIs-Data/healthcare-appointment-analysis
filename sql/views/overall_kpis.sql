USE healthcare_analytics;

SELECT
    COUNT(*) AS total_appointments,

    SUM(`No-show` = 'No') AS attended_appointments,

    SUM(`No-show` = 'Yes') AS missed_appointments,

    ROUND(
        SUM(`No-show` = 'Yes') / COUNT(*) * 100,
        2
    ) AS overall_no_show_rate

FROM appointments_raw;