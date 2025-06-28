# 🌱 Airbnb Clone – Seed Data

## 📦 Purpose
This file contains sample SQL `INSERT` statements to populate the Airbnb database with test data for development, testing, and demonstration purposes.

## 📋 Sample Data Includes
| Table       | Sample Entries |
|-------------|----------------|
| `users`     | 3              |
| `properties`| 2              |
| `bookings`  | 2              |
| `payments`  | 1              |
| `reviews`   | 2              |
| `messages`  | 2              |

## 🚀 Usage
Run the seed script after running your `schema.sql`:
```bash
psql -U your_user -d your_db -f schema.sql
psql -U your_user -d your_db -f seed.sql



##Make sure your UUIDs are enabled in the schema or use uuid_generate_v4() if supported