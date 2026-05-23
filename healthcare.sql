-- 2. Count of Patients by Medical Condition + Avg Billing Amount--
SELECT
    `Medical Condition`,
    COUNT(Name) AS patient_count,
    ROUND(AVG(`Billing Amount`), 2) AS avg_billing
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY patient_count DESC;

-- 3. Number of Patients Admitted Month‑over‑Month--
SELECT
    DATE_FORMAT(`Date of Admission`, '%Y-%m-01') AS month,
    COUNT(Name) AS patient_count
FROM healthcare_dataset
GROUP BY month
ORDER BY month;

-- Most Common Medication + Avg Billing Amount--
SELECT
    Medication,
    COUNT(Name) AS patient_count,
    ROUND(AVG(`Billing Amount`), 2) AS avg_billing
FROM healthcare_dataset
GROUP BY Medication
ORDER BY patient_count DESC;

-- Most Common Admission Type + Avg Billing Amount--
SELECT
    `Admission Type`,
    COUNT(Name) AS patient_count,
    ROUND(AVG(`Billing Amount`), 2) AS avg_billing
FROM healthcare_dataset
GROUP BY `Admission Type`
ORDER BY patient_count DESC;

-- Count & % of Female vs Male + Avg Billing Amount by Gender--
SELECT
    Gender,
    COUNT(Name) AS patient_count,
    ROUND(
        COUNT(Name) * 100.0 / (SELECT COUNT(*) FROM healthcare_dataset),
        2
    ) AS percentage_of_total,
    ROUND(AVG(`Billing Amount`), 2) AS avg_billing_amount
FROM healthcare_dataset
GROUP BY Gender;