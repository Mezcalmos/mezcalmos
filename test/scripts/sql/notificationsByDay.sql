WITH driversSentByDay AS(SELECT distinct on ("driverId")
    EXTRACT(day FROM "sentTime") as day,
    "driverId"
    FROM notifications
    WHERE ("sentTime" > '2021-09-01'::date AND "sentTime" < '2021-09-01'::date + interval '1 month')
    GROUP BY 1,2),

driversReceivedByDay AS(SELECT distinct on ("driverId")
    EXTRACT(day FROM "receivedTime") as day,
    "driverId"
    FROM notifications
    WHERE ("receivedTime" > '2021-09-01'::date AND "receivedTime" < '2021-09-01'::date + interval '1 month')
    GROUP BY 1,2),

driversReadByDay AS(SELECT distinct on ("driverId")
    EXTRACT(day FROM "readTime") as day,
    "driverId"
    FROM notifications
    WHERE ("readTime" > '2021-09-01'::date AND "readTime" < '2021-09-01'::date + interval '1 month')
    GROUP BY 1,2),


driverStatusByDay AS (SELECT 
  s.day,
  s."driverId",
  CASE WHEN r.day IS NOT NULL THEN true
       ELSE false END AS "received",
  CASE WHEN o.day IS NOT NULL THEN true
      ELSE false END AS "read"
  
FROM driversSentByDay s
LEFT JOIN driversReceivedByDay r 
ON s.day = r.day AND s."driverId" = r."driverId"
LEFT JOIN driversReadByDay o
ON s.day = o.day AND s."driverId" = o."driverId"),

uniqueNotifications AS (SELECT 
    day,
    count(*) as "uniqueSent",
    count(*) filter (where "received" = true) as uniqueReceived,
    count(*) filter (where "read" = true) as "uniqueRead"
FROM driverStatusByDay
GROUP BY 1),


totalNotifications AS(SELECT 
    EXTRACT(day FROM "sentTime") as day,
    count("sentTime") AS "sent",
    count("receivedTime") AS received,
    count("readTime") AS "read",
    count("receivedTime")*100/count("sentTime") AS receivedPercent,
    count("readTime")*100/count("sentTime") AS readPercent
FROM notifications
WHERE ("sentTime" > '2021-09-01'::date AND "sentTime" < '2021-09-01'::date + interval '1 month')
GROUP BY day)

SELECT
    *
FROM uniqueNotifications u
JOIN totalNotifications t
ON u.day = t.day



