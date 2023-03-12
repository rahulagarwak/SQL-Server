SELECT 
    CONCAT(c1.CName, ' VS ', c2.CName) AS 'Combinations'
FROM 
    Countries c1
    JOIN Countries c2 ON c1.Id < c2.Id
ORDER BY 
    c1.CName ASC ;

