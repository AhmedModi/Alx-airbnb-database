# **Database Normalization Report**

## Current Schema Status
- All tables satisfy **1NF** (atomic values, PKs exist).
- All tables satisfy **2NF** (no partial dependencies).
- All tables satisfy **3NF** (no transitive dependencies).

## Verification Process
1. **1NF Check:** Confirmed all tables have PKs and atomic attributes.
2. **2NF Check:** Verified all non-PK attributes depend on full PKs.
3. **3NF Check:** Ensured no non-key attributes depend on other non-key attributes.

## Potential Improvements
While the schema is already normalized, future considerations could include:
- Denormalizing for performance (e.g., caching `average_rating` in Property table).
- Adding constraints like `CHECK (end_date > start_date)` in Booking.
