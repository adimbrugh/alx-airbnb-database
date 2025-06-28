# 📁 Airbnb Clone – SQL Schema

## 🎯 Overview
This directory contains the full SQL schema used to define and create the tables for the Airbnb Clone database. The schema includes users, properties, bookings, payments, reviews, and messages.

## 📦 Included Tables

| Table        | Description                                |
|--------------|--------------------------------------------|
| `users`      | Stores user data including role and contact |
| `properties` | Lists properties hosted by users            |
| `bookings`   | Manages property reservations               |
| `payments`   | Records payment details for bookings        |
| `reviews`    | Contains reviews and ratings of properties  |
| `messages`   | Enables messaging between users             |

## 🔐 Constraints & Indexes
- All tables have UUID primary keys.
- Foreign key constraints enforce relational integrity.
- Indexes are created on frequently queried columns (e.g., `email`, `property_id`, `booking_id`).

## ⚙️ Features
- ENUM-like constraints on `role`, `status`, and `payment_method`.
- Rating value check (`1–5`).
- Automatic timestamp defaults for tracking creation and update times.

## 🗂️ Usage
You can run the schema using:
```bash
psql -U your_user -d your_db -f schema.sql
