USE healthcare_analytics;

SELECT
    'Hypertension' AS health_condition,
    SUM(Hipertension = 1) AS patients_with_condition,
    SUM(Hipertension = 1 AND `No-show` = 'Yes') AS no_shows,
    ROUND(
        SUM(Hipertension = 1 AND `No-show` = 'Yes')
        / SUM(Hipertension = 1) * 100,
        2
    ) AS no_show_rate
FROM appointments_raw

UNION ALL

SELECT
    'Diabetes',
    SUM(Diabetes = 1),
    SUM(Diabetes = 1 AND `No-show` = 'Yes'),
    ROUND(
        SUM(Diabetes = 1 AND `No-show` = 'Yes')
        / SUM(Diabetes = 1) * 100,
        2
    )
FROM appointments_raw

UNION ALL

SELECT
    'Alcoholism',
    SUM(Alcoholism = 1),
    SUM(Alcoholism = 1 AND `No-show` = 'Yes'),
    ROUND(
        SUM(Alcoholism = 1 AND `No-show` = 'Yes')
        / SUM(Alcoholism = 1) * 100,
        2
    )
FROM appointments_raw

UNION ALL

SELECT
    'Handicap',
    SUM(Handcap = 1),
    SUM(Handcap = 1 AND `No-show` = 'Yes'),
    ROUND(
        SUM(Handcap = 1 AND `No-show` = 'Yes')
        / SUM(Handcap = 1) * 100,
        2
    )
FROM appointments_raw;