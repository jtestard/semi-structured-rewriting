SELECT p1.name, (
    SELECT p2.name, COUNT(s2.key)
    FROM clickstream cs1,
         clickstream cs2,
         products p2
    WHERE p1.key = cs1.produc
    AND time-delta(cs1.time,cs2.time) < 60
    AND cs2.product = p2.key
    GROUP BY p2.key
    ORDER BY count
    LIMIT 30
) AS top30
FROM selected_products p1;
