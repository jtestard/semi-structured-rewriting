SELECT DISTINCT cs.day, cs.webpage, SUM(hours.count) AS count
    Q1(X=cs.day, Y=cs.webpage) AS hours
FROM clickstream cs;
