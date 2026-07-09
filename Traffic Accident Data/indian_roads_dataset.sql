SELECT * FROM accident.traffic_accidents;
use accident;
SELECT COUNT(*) AS Total_Accidents
FROM traffic_accidents;
SELECT SUM(casualties) AS Total_Casualties
FROM traffic_accidents;
SELECT SUM(casualties) AS Total_Casualties
FROM traffic_accidents;
SELECT AVG(risk_score) AS Average_Risk
FROM traffic_accidents;
SELECT state,
COUNT(*) AS Total_Accidents
FROM traffic_accidents
GROUP BY state;
SELECT city,
COUNT(*) AS Total
FROM traffic_accidents
GROUP BY city
HAVING COUNT(*) > 100;
SELECT accident_id,
risk_score,
CASE
    WHEN risk_score >= 80 THEN 'High Risk'
    WHEN risk_score >= 50 THEN 'Medium Risk'
    ELSE 'Low Risk'
END AS Risk_Category
FROM traffic_accidents;
SELECT accident_id,
risk_score,
ROW_NUMBER() OVER(ORDER BY risk_score DESC) AS Row_Num
FROM traffic_accidents;
WITH State_Risk AS (
    SELECT state,
           AVG(risk_score) AS Avg_Risk
    FROM traffic_accidents
    GROUP BY state
)
SELECT *
FROM State_Risk
ORDER BY Avg_Risk DESC
LIMIT 1;