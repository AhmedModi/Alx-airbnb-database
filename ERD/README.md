# Airbnb Database ER Diagram

## Overview
This Entity-Relationship Diagram (ERD) visually represents the database structure for an Airbnb-like application. It shows all tables, their columns, and the relationships between entities.

## Key Components
- **6 Main Entities**: 
  - Users (Guests/Hosts)
  - Properties
  - Bookings 
  - Payments
  - Reviews
  - Messages

## Relationship Types
| Relationship | Description |
|--------------|-------------|
| User → Property | One-to-Many (A host can list multiple properties) |
| Property → Booking | One-to-Many (A property can have many bookings) |
| Booking → Payment | One-to-One (Each booking has one payment) |
| User ↔ Message | Many-to-Many (Users can message each other) |

## Diagram Features
- Primary keys marked with 🔑
- Foreign keys shown with connection lines
- All attributes included for each entity
- Crow's foot notation (𓆟) indicates "many" relationships

## How to Use
1. Open `airbnb_erd.png` to view the visual diagram
2. Refer to `schema.sql` for the actual table definitions
3. See `requirements.md` for design decisions

> **Note**: Created with Draw.io. The original source file `Mastering Database Design.drawio` is included for future edits.
