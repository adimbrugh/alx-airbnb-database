# 📋 ERD Requirements - Airbnb Database Module

## 🎯 Objective
This document outlines the technical and structural requirements for the Entity-Relationship Diagram (ERD) of the Airbnb Database Module. It focuses on clearly representing the data model including entities, attributes, relationships, and constraints.

## 1. Identify Entities and Attributes

### 🧍 User
- `user_id` (PK, UUID, indexed)  
- `first_name`, `last_name` (NOT NULL)  
- `email` (UNIQUE, NOT NULL)  
- `password_hash` (NOT NULL)  
- `phone_number` (nullable)  
- `role` (ENUM: guest, host, admin)  
- `created_at` (timestamp)

### 🏠 Property
- `property_id` (PK, UUID, indexed)  
- `host_id` (FK → User.user_id)  
- `name`, `description`, `location` (NOT NULL)  
- `pricepernight` (DECIMAL, NOT NULL)  
- `created_at`, `updated_at` (timestamp)

### 📅 Booking
- `booking_id` (PK, UUID, indexed)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `start_date`, `end_date` (DATE, NOT NULL)  
- `total_price` (DECIMAL)  
- `status` (ENUM: pending, confirmed, canceled)  
- `created_at` (timestamp)

### 💳 Payment
- `payment_id` (PK, UUID, indexed)  
- `booking_id` (FK → Booking.booking_id)  
- `amount` (DECIMAL)  
- `payment_date` (timestamp)  
- `payment_method` (ENUM: credit_card, paypal, stripe)

### ⭐ Review
- `review_id` (PK, UUID, indexed)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `rating` (1–5, INTEGER)  
- `comment` (TEXT)  
- `created_at` (timestamp)

### 💬 Message
- `message_id` (PK, UUID, indexed)  
- `sender_id` (FK → User.user_id)  
- `recipient_id` (FK → User.user_id)  
- `message_body` (TEXT)  
- `sent_at` (timestamp)

---

## 2. Define Relationships

- **User → Property**: One-to-Many (One host owns many properties)  
- **User → Booking**: One-to-Many (One guest can make many bookings)  
- **Property → Booking**: One-to-Many (Each property can have many bookings)  
- **Booking → Payment**: One-to-One (Each booking has one payment)  
- **User → Review**: One-to-Many (User can leave many reviews)  
- **Property → Review**: One-to-Many (Property can have many reviews)  
- **User → Message**: One-to-Many in both sender and receiver direction (Messaging between users)

---

## ✅ Requirements

### 1. **Entities**
The ER diagram must include the following entities with appropriate primary keys:
- `User`
- `Property`
- `Booking`
- `Payment`
- `Review`
- `Message`

### 2. **Attributes**
Each entity should have clearly labeled attributes:
- Correct data types (e.g., UUID, VARCHAR, DECIMAL)
- Constraints (e.g., NOT NULL, UNIQUE, ENUM, CHECK)
- Timestamp fields where applicable (e.g., `created_at`, `updated_at`)

### 3. **Primary Keys**
- Each table must have a primary key.
- Use UUIDs as the primary key format.
- Primary keys should be indexed.

### 4. **Foreign Keys**
- Proper foreign key relationships must be defined between:
  - `User` → `Property` (host_id)
  - `User` → `Booking` (user_id)
  - `Property` → `Booking` (property_id)
  - `Booking` → `Payment` (booking_id)
  - `User` → `Review` (user_id)
  - `Property` → `Review` (property_id)
  - `User` → `Message` (sender_id, recipient_id)

### 5. **Relationships**
- Represent One-to-Many and One-to-One relationships using appropriate notation (e.g., crow's foot, arrows).
- Label relationships clearly.

### 6. **Constraints**
- Unique constraint on `User.email`
- ENUM values enforced on:
  - `User.role`: guest, host, admin
  - `Booking.status`: pending, confirmed, canceled
  - `Payment.payment_method`: credit_card, paypal, stripe
- Rating CHECK constraint: between 1 and 5

### 7. **Indexes**
- Explicitly indicate indexing on:
  - `email` in `User`
  - `property_id` in `Booking`, `Review`
  - `booking_id` in `Payment`

---


## 🛠 Tools
- [Lucidchart](https://www.lucidchart.com/)


---

## 🧠 Author Note
This ERD forms the foundation for future database implementation, migrations, and optimizations in the Airbnb Clone system. It must be kept up to date with any schema changes.
