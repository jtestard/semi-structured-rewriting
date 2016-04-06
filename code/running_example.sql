Promotion((*\underline{p\_promo\_sk}*), p_promo_name, p_item_sk,...);
WebSale(ws_promo_sk, ws_sales_price,...);

SELECT p1.p_promo_name, (
    SELECT p2.p_promo_name, 
          SUM(ws_sales_price) AS price
    FROM Promotion AS p2, WebSales
    WHERE ws_promo_sk = p2.p_promo_sk
    AND (*\textcolor{magenta}{@p1}*).p_item_sk = p2.p_item_sk
    GROUP BY p2.p_item_sk
    ORDER BY price DESC
    LIMIT 3
) AS top_web_sales
FROM Promotion AS p1
LIMIT L;
(*\eat{WHERE p1.p_promo_sk < L;}*)

