# Performance Monitoring and Refinement Report

## Objective
To monitor query performance using `EXPLAIN ANALYZE` and improve slow queries by applying schema optimizations like indexing.

---

## Query Monitored
```sql
SELECT * FROM bookings WHERE user_id = 5 AND start_date > '2024-01-01';
