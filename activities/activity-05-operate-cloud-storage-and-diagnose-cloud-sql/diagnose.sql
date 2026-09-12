SELECT state, count(*) AS connections
FROM pg_stat_activity
GROUP BY state;

SELECT query, calls, mean_exec_time
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 10;
