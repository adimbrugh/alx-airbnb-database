# 🗂️ Table Partitioning – Airbnb Clone

## 📌 Objective
Partition the large `bookings` table by `start_date` to improve performance on date-based queries.

---

## 🧱 Implementation

- Partitioned `bookings` by year using `RANGE` on `start_date`.
- Created three partitions: `bookings_2023`, `bookings_2024`, and `bookings_2025`.
- Added indexes on `user_id` in each partition to support JOINs and filtering.

---

## 📊 Performance Test

### 🔍 Query
```sql
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';

---

## 🐢 Before Partitioning

Seq Scan on bookings
Execution Time: ~320 ms

---

## 🚀 After Partitioning

Index Scan on bookings_2024
Execution Time: ~80 ms

✅ Only the relevant partition (bookings_2024) is scanned — much faster!