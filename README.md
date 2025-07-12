# Hospital Management System - SQL Project

This project provides a complete SQL-based Hospital Management System database built using MySQL. It includes table definitions, sample data inserts, and a variety of SQL queries for learning and testing purposes.

## Files Included

- Hospital management system.sql  
  - Contains:
    - Database and table creation scripts
    - Insert statements for Patients, Doctors, Appointments, Billing, etc.
    - SQL queries for practice and analysis

## Database Tables

- Patients
- Doctors
- DoctorSchedule
- Appointments
- MedicalRecords
- Prescriptions
- Billing

All tables are linked with proper primary and foreign key constraints.

## How to Run

1. Install MySQL (Workbench, XAMPP, or CLI).
2. Open your MySQL client.
3. Run the SQL file:
   - Using MySQL CLI:
     mysql -u root -p < "Hospital management system.sql"
   - Or in Workbench:
     SOURCE path/to/Hospital management system.sql;

## SQL Topics Covered

- SELECT, WHERE, ORDER BY, BETWEEN
- JOINs between multiple tables
- Aggregation: SUM, AVG, COUNT, MAX
- CASE statements
- GROUP BY and HAVING
- Stored Procedure example for billing status


