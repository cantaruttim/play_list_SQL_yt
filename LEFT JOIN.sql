-- LEFT JOIN
-- POSITION
SELECT 
	id_position,
	ROUND(
		AVG(
			CAST(
				salary AS DECIMAL(16,2)
			)
		), 
	2) AS avg_Salary_Position
FROM vw_employee
GROUP BY 1

-- LEVEL POSITION
SELECT 
	id_level_position,
	ROUND(AVG(CAST(salary AS DECIMAL(16,2))), 2) AS avg_Salary_Level_Position
FROM vw_employee
GROUP BY 1;

SELECT 
	e.*,
	p.avg_Salary_Position,
	lp.avg_Salary_Level_Position
FROM vw_employee e
LEFT JOIN (
	SELECT 
		id_position,
		ROUND(AVG(CAST(salary AS DECIMAL(16,2))), 2) AS avg_Salary_Position
	FROM vw_employee
	GROUP BY 1
) p ON e.id_position = p.id_position
LEFT JOIN (
	SELECT 
		id_level_position,
		ROUND(AVG(CAST(salary AS DECIMAL(16,2))), 2) AS avg_Salary_Level_Position
	FROM vw_employee
	GROUP BY 1
) lp ON e.id_level_position = lp.id_level_position







	
SELECT 
	pp.*, p.avg_Salary_Position
FROM position pp 
LEFT JOIN (
	SELECT 
		id_position,
		ROUND(AVG(CAST(salary AS DECIMAL(16,2))), 2) AS avg_Salary_Position
	FROM vw_employee
	GROUP BY 1
	
) p ON pp.id_position = p.id_position


/*
CREATE VIEW vw_employee AS 
SELECT 
	e.*, p.id_position, lp.id_level_position
FROM employee e
LEFT JOIN position p
	ON e.position = p.name_position
LEFT JOIN level_position lp
	ON e.level_position = lp.name_level_position
;


CREATE TABLE level_position (
	id_level_position int NOT NULL,
	name_level_position VARCHAR(100) NOT NULL
);

INSERT INTO level_position (id_level_position, name_level_position) VALUES (10, 'Mid'), (11, 'Junior'), (12, 'Senior'), (13, 'Lead');

CREATE TABLE position (
	id_position int NOT NULL,
	name_position VARCHAR(100) NOT NULL
);


INSERT INTO position (id_position, name_position) VALUES (1, 'Consultant'), (2, 'Engineer'), (3, 'Manager'), (4, 'Analyst'), (5, 'Coordinator'), (6, 'Technician');
*/