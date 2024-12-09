COLUMN "Age Range" FORMAT A9
SELECT
    CASE
        WHEN cust_age < 10 THEN '<10'
        WHEN cust_age BETWEEN 10 AND 19 THEN '10 - 19'
        WHEN cust_age BETWEEN 20 AND 29 THEN '20 - 29'
        WHEN cust_age BETWEEN 30 AND 39 THEN '30 - 39'
        WHEN cust_age BETWEEN 40 AND 49 THEN '40 - 49'
        WHEN cust_age BETWEEN 50 AND 59 THEN '50 - 59'
        ELSE '>60'
    END AS "Age Range",
    COUNT(*) AS "No_Of_Cust",
    ROUND(((SELECT COUNT(*)
            FROM CUSTOMER c
            JOIN appointment a ON c.cust_id = a.cust_id
            JOIN appointment_service apt ON a.apt_no = apt.apt_no
            JOIN service s ON apt.service_no = s.service_no
            WHERE s.service_name = 'VDBWAUJK') * 100.0) / (SELECT COUNT(*) FROM CUSTOMER c
            JOIN appointment a ON c.cust_id = a.cust_id
            JOIN appointment_service apt ON a.apt_no = apt.apt_no
            JOIN service s ON apt.service_no = s.service_no), 2) AS "Percentage"
FROM customer
GROUP BY cust_age
ORDER BY cust_age;
