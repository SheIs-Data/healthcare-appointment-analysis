# Healthcare Appointment Analysis

## Project Overview

This project analyzes healthcare appointment data to identify
patterns in appointment attendance, no-shows, patient behaviour,
waiting times, SMS reminders, and demographic characteristics.

The project combines SQL analysis with an interactive Power BI
dashboard to transform raw healthcare appointment data into
actionable insights.

## Objectives

- Analyze appointment attendance and no-show patterns
- Identify demographic groups with higher no-show rates
- Examine the relationship between waiting time and no-shows
- Analyze SMS reminder and attendance outcomes
- Identify neighbourhoods with the highest appointment volumes
- Examine appointment volumes by health condition
- Compare repeat and one-time patients

## Tools & Technologies

- MySQL
- SQL
- Power BI
- DAX
- Power Query
- Excel

## Key Analysis

### No-Show Rate by Gender

Female: 20.31%

Male: 19.97%

### Waiting Time Analysis

No-show rates were analyzed across:

- Same Day
- 1–7 Days
- 8–14 Days
- 15–30 Days
- 31–60 Days
- 61+ Days

### SMS Reminder Analysis

Attendance outcomes were compared between patients who:

- Received an SMS reminder
- Did not receive an SMS reminder

### Neighbourhood Analysis

The dataset contains 81 neighbourhoods.

## Power BI Dashboard

### Page 1 — Appointment Overview

![Dashboard Page 1] screenshots/Appointment Overview.png

### Page 2 — Patient & Appointment Insights

![Dashboard Page 2] screenshots/Patient & Appointment Insights.png

## Project Structure

```text
sql/
├── Screenshots/
└── views/

powerbi/

screenshots/
