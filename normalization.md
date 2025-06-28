# 📘 Airbnb Database Normalization Report

## 🎯 Objective
Apply normalization principles to ensure the database is in the third normal form (3NF).

---

## ✅ 1. What is 3NF?

A table is in **Third Normal Form (3NF)** if:
1. It is in **Second Normal Form (2NF)**.
2. It has **no transitive dependencies** (i.e., non-key attributes do not depend on other non-key attributes).

---

## 📂 2. Review of the Original Schema

### **Entities Reviewed**
- `User`
- `Property`
- `Booking`
- `Payment`
- `Review`
- `Message`

Each table:
- Has a **single primary key** (UUID)
- Does not include **repeating groups**
- Has **atomic** attribute values
- Uses **foreign keys** to manage relationships

---

## 🧹 3. Normalization Steps

### 🔹 First Normal Form (1NF)
- All attributes are atomic (e.g., no lists or composite values).
- Each record is uniquely identified by a primary key.
✅ **Achieved** for all entities.

---

### 🔹 Second Normal Form (2NF)
- All tables have single-column primary keys (UUID).
- No partial dependencies exist (since no composite keys are used).
✅ **Achieved** for all entities.

---

### 🔹 Third Normal Form (3NF)
- **No transitive dependencies** detected in the schema:
  - In `User`, attributes like `email`, `role`, and `created_at` directly depend on the `user_id`.
  - In `Property`, all details relate directly to `property_id` and are not dependent on `host_id`.
  - In `Booking`, `total_price` is calculated but stored appropriately for historical record-keeping.
  - `Review`, `Payment`, and `Message` tables are well-structured, and no attribute depends on another non-key attribute.
✅ **All entities comply with 3NF.**

---

## 📌 4. Notes & Justification

- I avoid data redundancy by using foreign keys instead of repeating host/user info in other tables.
- ENUM types (e.g., `role`, `status`, `payment_method`) are allowed for data integrity and do not violate 3NF since they are atomic and not derived from other attributes.
- The schema is **well-structured**, and **no structural changes** were needed to achieve 3NF.

---

## 🧠 Conclusion

✅ **The Airbnb database schema meets all requirements of Third Normal Form (3NF)**.  
It is fully normalized, avoids redundancy, and maintains referential integrity using well-defined foreign key relationships.

