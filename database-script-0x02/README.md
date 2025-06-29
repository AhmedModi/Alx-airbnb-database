## **Key Features of the Sample Data**

1. **Realistic Relationships**:
   - Hosts own multiple properties
   - Guests make multiple bookings
   - Payments linked to confirmed bookings
   - Reviews reference both properties and guests

2. **Dynamic Pricing**:
   - `total_price` calculated from `price_per_night × duration`
   - Uses subqueries to maintain referential integrity

3. **Varied Statuses**:
   - Mix of confirmed, pending, and (implied) canceled bookings

4. **Natural Communication Flow**:
   - Guest-host messages
   - Guest-guest messages
   - Timestamps auto-generated

5. **Real-World Scenarios**:
   - Different property types (cabin, loft, villa, studio)
   - Various locations (CO, FL, NY)
   - Mixed ratings (5-star and 4-star reviews)

## **How to Use This Script**

1. Save as `seed.sql` in your project
2. Run after executing your schema DDL
3. Verify with sample queries:
   ```sql
   -- Check data counts
   SELECT role, COUNT(*) FROM users GROUP BY role;
   SELECT host_id, COUNT(*) FROM properties GROUP BY host_id;
   
   -- View guest bookings with property details
   SELECT u.first_name, p.name, b.start_date, b.end_date 
   FROM bookings b
   JOIN users u ON b.user_id = u.user_id
   JOIN properties p ON b.property_id = p.property_id;
   ```
