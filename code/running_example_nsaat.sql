CREATE TEMPORARY TABLE T AS (
 SELECT DISTINCT suppkey
 FROM supplier
 LIMIT L
);

SELECT t1.suppkey, t1.suppname, (
 CASE t2 IS NULL THEN [] ELSE t2
)
FROM T AS t1 LEFT OUTER JOIN (
 SELECT t2.suppkey, NEST(brand, total) AS N
 FROM (
  SELECT t2.suppkey, brand, total,
   row_number() OVER (
     PARTITION BY t2.suppkey
     ORDER BY total DESC) AS rn
  FROM (
   SELECT p.brand, COUNT(*) AS total, 
   FROM part AS p, partsupp AS ps, T AS t2
   WHERE t2.suppkey = ps.suppkey
   AND ps.partkey = p.partkey
   GROUP BY t2.suppkey, p.brand
  ) AS i1
 ) AS i2
 WHERE rn <= 3
 GROUP BY t2.suppkey
) AS i3
ON t1.suppkey = t2.suppkey;
