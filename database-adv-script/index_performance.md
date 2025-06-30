# 🚀 Index Optimization – Airbnb Clone

## 🎯 Objective
Improve query performance by creating indexes on frequently queried columns in the `users`, `bookings`, and `properties` tables.

---

## 🔍 Step 1: High-Usage Columns

We identified the following high-traffic columns from JOINs, WHERE clauses, and ORDER BY operations:

| Table       | Column           | Usage Context                 |
|-------------|------------------|-------------------------------|
| `users`     | `user_id`        | JOIN with `bookings`         |
|             | `email`          | Authentication, lookup       |
| `bookings`  | `user_id`        | JOIN with `users`            |
|             | `property_id`    | JOIN with `properties`       |
|             | `created_at`     | ORDER BY in history queries  |
| `properties`| `host_id`        | JOIN with `users`            |
|             | `created_at`     | ORDER BY in listing views    |

---

## 🧱 Step 2: Index Creation
File: `database_index.sql`

---

## 📈 Step 3: Performance Testing with EXPLAIN ANALYZE
🔬 Query: Get total bookings per user

---

## 🐢 Before Index (No index on bookings.user_id)

---

## 🚀 After Index (Index on bookings.user_id created)

---

## Summary
Indexes greatly improve performance for large datasets.

Focus on indexing columns used in JOINs, WHERE, and ORDER BY clauses.

Use EXPLAIN ANALYZE to validate performance gains.

---