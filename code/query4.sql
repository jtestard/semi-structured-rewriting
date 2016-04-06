SELECT c_name, (
    SELECT o_totalprice
    FROM orders
    WHERE c_clerk_key = o_clerk_key
    ORDER BY price DESC
    LIMIT K
) AS top_orders
FROM clerks
WHERE c_clerk_key IN (/*selected from application*/)
AND c_clerk_store = X;
