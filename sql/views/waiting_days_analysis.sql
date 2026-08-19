-- use the query below to calculate waiting days
/*
USE healthcare_analytics;

SELECT
    AppointmentID,
    PatientId,
    ScheduledDay,
    AppointmentDay,
    DATEDIFF(
        AppointmentDay,
        DATE(ScheduledDay)
    ) AS waiting_days,
    `No-show`
FROM appointments_raw
LIMIT 20;
*/
-- Before calculating rates, let’s check whether any appointment dates appear to occur before the scheduled date.
/*
ELECT
    COUNT(*) AS negative_waiting_days
FROM appointments_raw
WHERE DATEDIFF(
    AppointmentDay,
    DATE(ScheduledDay)
) < 0;
*/
/*
SELECT
    PatientId,
    AppointmentID,
    ScheduledDay,
    AppointmentDay,
    DATEDIFF(
        AppointmentDay,
        DATE(ScheduledDay)
    ) AS waiting_days,
    `No-show`
FROM appointments_raw
WHERE DATEDIFF(
    AppointmentDay,
    DATE(ScheduledDay)
) < 0
ORDER BY waiting_days;
*/

SELECT
    CASE
        WHEN DATEDIFF(AppointmentDay, DATE(ScheduledDay)) = 0
            THEN 'Same Day'
        WHEN DATEDIFF(AppointmentDay, DATE(ScheduledDay)) BETWEEN 1 AND 7
            THEN '1-7 Days'
        WHEN DATEDIFF(AppointmentDay, DATE(ScheduledDay)) BETWEEN 8 AND 14
            THEN '8-14 Days'
        WHEN DATEDIFF(AppointmentDay, DATE(ScheduledDay)) BETWEEN 15 AND 30
            THEN '15-30 Days'
        WHEN DATEDIFF(AppointmentDay, DATE(ScheduledDay)) BETWEEN 31 AND 60
            THEN '31-60 Days'
        WHEN DATEDIFF(AppointmentDay, DATE(ScheduledDay)) >= 61
            THEN '61+ Days'
    END AS waiting_group,

    COUNT(*) AS total_appointments,

    SUM(`No-show` = 'Yes') AS no_shows,

    ROUND(
        SUM(`No-show` = 'Yes') / COUNT(*) * 100,
        2
    ) AS no_show_rate

FROM appointments_raw

WHERE DATEDIFF(
    AppointmentDay,
    DATE(ScheduledDay)
) >= 0

GROUP BY waiting_group

ORDER BY
    CASE waiting_group
        WHEN 'Same Day' THEN 1
        WHEN '1-7 Days' THEN 2
        WHEN '8-14 Days' THEN 3
        WHEN '15-30 Days' THEN 4
        WHEN '31-60 Days' THEN 5
        WHEN '61+ Days' THEN 6
    END;