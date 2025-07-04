# Partitioning Performance Report

## Objective
Optimize query performance on the large `bookings` table by implementing table partitioning on the `start_date` column.

## Partitioning Strategy
We used **RANGE partitioning** based on `YEAR(start_date)`:
```sql
PARTITION BY RANGE (YEAR(start_date))
