-- Query 1: Total bookings by user
EXPLAIN ANALYZE
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- Optimization: Add index on bookings.user_id
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);


-- Query 2: Get bookings with user and property data for last 30 days
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    u.email,
    p.name AS property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '30 days';

-- Optimization: Composite index for frequent filter + join
CREATE INDEX IF NOT EXISTS idx_bookings_start_user ON bookings(start_date, user_id);


---




---

# 📊 Continuous Monitoring and Optimization – Airbnb Clone

## 🎯 Objective
Improve query performance through regular analysis using `EXPLAIN ANALYZE` and schema/index refinements.

---

## 🧪 Step 1: Monitor Query Performance

### 🔍 Query 1: Total Bookings Per User

```sql
SELECT user_id, COUNT(*) FROM bookings GROUP BY user_id;


## ❌ Before Index
Seq Scan on bookings
Execution Time: 180ms



## ✅ After Adding Index on user_id 
CREATE INDEX idx_bookings_user_id ON bookings(user_id);


Index Scan on user_id
Execution Time: 60ms

---

### 🔍 Query 2: Bookings in Last 30 Days with User and Property

SELECT b.booking_id, b.start_date, u.email, p.name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '30 days';


## ❌ Before Optimization
Seq Scan on bookings
Hash Join with users and properties
Execution Time: 230ms


## ✅ After Composite Index (start_date + user_id)
CREATE INDEX idx_bookings_start_user ON bookings(start_date, user_id);


Index Scan using composite index
Execution Time: 75ms