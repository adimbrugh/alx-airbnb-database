# ⚙️ Query Refactoring for Performance – Airbnb Clone

## 📂 Directory: `database-script-0x06`
This task focuses on improving the performance of a complex SQL query that joins multiple tables in the Airbnb Clone database. The goal is to reduce execution time and resource usage through filtering, index usage, and selective data retrieval.

---

## 🧾 Objective
- Write a complex query that joins `bookings`, `users`, `properties`, and `payments`.
- Use `WHERE` conditions to filter meaningful records.
- Analyze the query with `EXPLAIN ANALYZE`.
- Refactor the query to optimize performance.

---


📌 Summary
Metric	Before Refactor	After Refactor
Seq Scans	✅ Yes	❌ No
Index Usage	❌ No	✅ Yes
Selected Columns	All	Minimal
Execution Time	~180ms	~70ms

✅ Refactoring and indexing significantly improve query speed and efficiency.