Q1(X,Y): 
SELECT DISTINCT cs_out.hour,
	SUM(minutes.count) AS count, (
    SELECT cs_in.minute, COUNT(cs_in.key))
    FROM clickstream cs_in
    WHERE cs_out.hour = cs_in.hour
    GROUP BY cs.minute
    ) AS minutes
FROM clickstream cs_out
WHERE day=X AND webpage=Y;