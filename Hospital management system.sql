CREATE DATABASE hospital_management 
USE hospital_management

--patients details:
CREATE TABLE Patients (
PatientID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Gender VARCHAR(10),
DateOfBirth DATE, 
PhoneNumber VARCHAR(15),
Email VARCHAR(100),
Address VARCHAR(255),
BloodGroup VARCHAR(5),
EmergencyContact VARCHAR(15))
    
    --doctors details:
CREATE TABLE Doctors(
DoctorID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Specialty VARCHAR(50),
PhoneNumber VARCHAR(15),
Email VARCHAR(100),
RoomNumber VARCHAR(10))

--DoctorSchedule details
CREATE TABLE DoctorSchedule (
ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
DoctorID INT,
DayOfWeek VARCHAR(10),
StartTime TIME,
EndTime TIME,
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID))

--Appointments details
CREATE TABLE Appointments (
AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
PatientID INT,
DoctorID INT,
AppointmentDate DATE,
AppointmentTime TIME,
AppointmentStatus VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID))
    
--MedicalRecords details
CREATE TABLE MedicalRecords (
RecordID INT PRIMARY KEY AUTO_INCREMENT,
PatientID INT,
DoctorID INT,
AppointmentID INT,
Diagnosis VARCHAR(255),
Treatment VARCHAR(255),
Prescription VARCHAR(255),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID))

--Prescriptions details
CREATE TABLE Prescriptions (
PrescriptionID INT PRIMARY KEY AUTO_INCREMENT,
RecordID INT,
MedicationName VARCHAR(100),
Dosage VARCHAR(50),
Frequency VARCHAR(50),  vb b
Duration VARCHAR(50),
Notes VARCHAR(100),
FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID))


--billing details
CREATE TABLE Billing (
BillID INT PRIMARY KEY AUTO_INCREMENT,
PatientID INT,
AppointmentID INT,
TotalAmount DECIMAL(10, 2),
PaymentStatus VARCHAR(20) DEFAULT 'Pending',
PaymentDate DATE,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID))

select *from  MedicalRecords

INSERT INTO Patients (FirstName, LastName, Gender, DateOfBirth, PhoneNumber, Email, Address, BloodGroup, EmergencyContact) VALUES
('John', 'Doe', 'Male', '1990-01-15', '9876543210', 'john.doe@example.com', '123 Main St', 'O+', '9999999999'),
('Jane', 'Smith', 'Female', '1985-08-25', '9123456780', 'jane.smith@example.com', '456 Park Ave', 'A-', '8888888888'),
('Alice', 'Brown', 'Female', '1992-03-12', '9012345678', 'alice.b@example.com', '789 Oak St', 'B+', '9998887777'),
('Bob', 'Taylor', 'Male', '1988-06-10', '9901234567', 'bob.t@example.com', '321 Maple Rd', 'AB+', '9111222333'),
('Charlie', 'Lee', 'Male', '1975-02-20', '9988776655', 'charlie.l@example.com', '654 Elm Dr', 'A+', '9333444555'),
('Diana', 'Scott', 'Female', '1980-11-30', '9234567890', 'diana.s@example.com', '98 Pine Ln', 'O-', '9223344556'),
('Ethan', 'Morris', 'Male', '1995-04-17', '9567890123', 'ethan.m@example.com', '102 Willow St', 'B-', '9223344112'),
('Fiona', 'Turner', 'Female', '1991-07-29', '9456123789', 'fiona.t@example.com', '202 Birch Pl', 'A-', '9344556677'),
('George', 'Campbell', 'Male', '1993-09-10', '9123789456', 'george.c@example.com', '402 Lakeview', 'O+', '9119988776'),
('Hannah', 'Green', 'Female', '1987-05-05', '9988123456', 'hannah.g@example.com', '508 Ridge St', 'AB-', '9444332211'),
('Isaac', 'Hall', 'Male', '1996-12-19', '9988771122', 'isaac.h@example.com', '15 Forest Ln', 'B+', '9332211445'),
('Julia', 'Walker', 'Female', '1983-03-08', '9234578123', 'julia.w@example.com', '400 Hilltop Rd', 'O+', '9999887766'),
('Kevin', 'Allen', 'Male', '1990-09-27', '9345678901', 'kevin.a@example.com', '87 Meadow St', 'A+', '9223334445'),
('Laura', 'Young', 'Female', '1978-01-14', '9456781234', 'laura.y@example.com', '333 Spring St', 'B-', '9001122334'),
('Mark', 'King', 'Male', '1989-10-10', '9876012345', 'mark.k@example.com', '289 Summer Rd', 'O-', '9776655443'),
('Nancy', 'Wright', 'Female', '1994-11-15', '9234789012', 'nancy.w@example.com', '198 Fall St', 'AB+', '9887766554'),
('Oscar', 'Hughes', 'Male', '1982-04-20', '9877654321', 'oscar.h@example.com', '178 Winter Ln', 'A-', '9443322110'),
('Paula', 'Reed', 'Female', '1997-08-07', '9456123098', 'paula.r@example.com', '567 Lake Blvd', 'O+', '9221122334'),
('Quentin', 'Bailey', 'Male', '1986-02-25', '9345612908', 'quentin.b@example.com', '45 Forest Rd', 'B+', '9333444555'),
('Rachel', 'Evans', 'Female', '1998-06-21', '9543216789', 'rachel.e@example.com', '88 Garden St', 'A+', '9887766554'),
('Steve', 'Diaz', 'Male', '1992-10-30', '9678123456', 'steve.d@example.com', '66 Canyon Dr', 'B-', '9223344556'),
('Tina', 'Foster', 'Female', '1990-12-01', '9456789012', 'tina.f@example.com', '21 Bay St', 'O-', '9111223344'),
('Umar', 'Griffin', 'Male', '1984-11-18', '9988776655', 'umar.g@example.com', '76 Horizon Ave', 'AB-', '9001122334'),
('Vera', 'Jordan', 'Female', '1993-01-09', '9123456780', 'vera.j@example.com', '99 View Rd', 'A+', '9444332211'),
('Will', 'Morgan', 'Male', '1995-03-15', '9456123456', 'will.m@example.com', '22 Parkside', 'B+', '9332211445')


INSERT INTO Doctors (FirstName, LastName, Specialty, PhoneNumber, Email, RoomNumber) VALUES
('Emily', 'Clark', 'Cardiology', '9012345678', 'emily.clark@hospital.com', '101A'),
('Michael', 'Brown', 'Dermatology', '9023456789', 'michael.brown@hospital.com', '202B'),
('Sara', 'White', 'Neurology', '9034567890', 'sara.white@hospital.com', '303C'),
('David', 'Wilson', 'Orthopedics', '9045678901', 'david.wilson@hospital.com', '404D'),
('Linda', 'Martin', 'Pediatrics', '9056789012', 'linda.martin@hospital.com', '505E')

INSERT INTO DoctorSchedule (DoctorID, DayOfWeek, StartTime, EndTime) VALUES
(1, 'Monday', '09:00:00', '13:00:00'),
(1, 'Wednesday', '10:00:00', '14:00:00'),
(2, 'Tuesday', '11:00:00', '15:00:00'),
(2, 'Thursday', '10:00:00', '14:00:00'),
(3, 'Monday', '09:30:00', '12:30:00'),
(3, 'Friday', '13:00:00', '17:00:00'),
(4, 'Wednesday', '09:00:00', '12:00:00'),
(4, 'Saturday', '10:00:00', '14:00:00'),
(5, 'Tuesday', '10:30:00', '13:30:00'),
(5, 'Friday', '09:00:00', '11:00:00')


INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, AppointmentStatus) VALUES
(1, 1, '2025-06-25', '09:00:00', 'Scheduled'),
(2, 2, '2025-06-25', '11:00:00', 'Scheduled'),
(3, 3, '2025-06-26', '10:30:00', 'Completed'),
(4, 4, '2025-06-26', '12:00:00', 'Scheduled'),
(5, 5, '2025-06-27', '11:30:00', 'Scheduled'),
(6, 1, '2025-06-27', '09:15:00', 'Scheduled'),
(7, 2, '2025-06-28', '11:00:00', 'Completed'),
(8, 3, '2025-06-28', '10:45:00', 'Scheduled'),
(9, 4, '2025-06-29', '12:30:00', 'Cancelled'),
(10, 5, '2025-06-29', '11:30:00', 'Scheduled'),
(11, 1, '2025-06-30', '09:45:00', 'Scheduled'),
(12, 2, '2025-06-30', '11:00:00', 'Completed'),
(13, 3, '2025-07-01', '10:30:00', 'Scheduled'),
(14, 4, '2025-07-01', '12:00:00', 'Scheduled'),
(15, 5, '2025-07-02', '11:30:00', 'Scheduled'),
(16, 1, '2025-07-02', '09:15:00', 'Cancelled'),
(17, 2, '2025-07-03', '11:00:00', 'Scheduled'),
(18, 3, '2025-07-03', '10:45:00', 'Scheduled'),
(19, 4, '2025-07-04', '12:30:00', 'Scheduled'),
(20, 5, '2025-07-04', '11:30:00', 'Completed'),
(21, 1, '2025-07-05', '09:00:00', 'Scheduled'),
(22, 2, '2025-07-05', '10:00:00', 'Scheduled'),
(23, 3, '2025-07-06', '11:00:00', 'Scheduled'),
(24, 4, '2025-07-06', '12:00:00', 'Scheduled'),
(25, 5, '2025-07-06', '09:30:00', 'Scheduled')


INSERT INTO MedicalRecords (PatientID, DoctorID, AppointmentID, Diagnosis, Treatment, Prescription) VALUES
(1, 1, 1, 'Hypertension', 'Lifestyle change, medication', 'Lisinopril'),
(2, 2, 2, 'Acne', 'Topical treatment', 'Benzoyl Peroxide'),
(3, 3, 3, 'Migraine', 'Pain relievers', 'Ibuprofen'),
(4, 4, 4, 'Fracture', 'Casting', 'Paracetamol'),
(5, 5, 5, 'Fever', 'Rest and fluids', 'Paracetamol'),
(6, 1, 6, 'High BP', 'Medication', 'Amlodipine'),
(7, 2, 7, 'Skin allergy', 'Antihistamines', 'Cetirizine'),
(8, 3, 8, 'Seizure', 'Medication', 'Levetiracetam'),
(9, 4, 9, 'Sprain', 'Ice and compression', 'Ibuprofen'),
(10, 5, 10, 'Flu', 'Rest', 'Tamiflu'),
(11, 1, 11, 'Cholesterol', 'Statins', 'Atorvastatin'),
(12, 2, 12, 'Eczema', 'Cream', 'Hydrocortisone'),
(13, 3, 13, 'Headache', 'Pain relief', 'Paracetamol'),
(14, 4, 14, 'Knee Pain', 'Physiotherapy', 'Diclofenac'),
(15, 5, 15, 'Cough', 'Syrup', 'Benadryl'),
(16, 1, 16, 'Diabetes', 'Insulin therapy', 'Metformin'),
(17, 2, 17, 'Skin Rash', 'Cream', 'Clotrimazole'),
(18, 3, 18, 'Epilepsy', 'Long-term medication', 'Valproate'),
(19, 4, 19, 'Back Pain', 'Heat therapy', 'Naproxen'),
(20, 5, 20, 'Child fever', 'Syrup', 'Calpol'),
(21, 1, 21, 'Heart Palpitation', 'ECG, rest', 'Bisoprolol'),
(22, 2, 22, 'Psoriasis', 'Creams', 'Salicylic acid'),
(23, 3, 23, 'Tremors', 'Neurological treatment', 'Propranolol'),
(24, 4, 24, 'Bone pain', 'Calcium', 'Vitamin D'),
(25, 5, 25, 'Cold', 'Hydration and rest', 'Zinc tablets')

INSERT INTO Prescriptions (RecordID, MedicationName, Dosage, Frequency, Duration, Notes) VALUES
(1, 'Lisinopril', '10mg', 'Once daily', '30 days', 'Check BP regularly'),
(2, 'Benzoyl Peroxide', '5%', 'Twice daily', '14 days', 'Avoid eyes'),
(3, 'Ibuprofen', '400mg', 'Thrice daily', '5 days', 'After meals'),
(4, 'Paracetamol', '500mg', 'Twice daily', '10 days', 'Pain relief'),
(5, 'Paracetamol', '500mg', 'Every 6 hours', '3 days', 'Hydration advised'),
(6, 'Amlodipine', '5mg', 'Once daily', '60 days', 'Check BP weekly'),
(7, 'Cetirizine', '10mg', 'At night', '7 days', 'May cause drowsiness'),
(8, 'Levetiracetam', '500mg', 'Twice daily', 'Ongoing', 'Take regularly'),
(9, 'Ibuprofen', '200mg', 'Thrice daily', '3 days', 'Avoid alcohol'),
(10, 'Oseltamivir', '75mg', 'Twice daily', '5 days', 'Start early'),
(11, 'Atorvastatin', '20mg', 'At night', '90 days', 'Lipid test after 30 days'),
(12, 'Hydrocortisone', 'Apply', 'Twice daily', '2 weeks', 'Do not overuse'),
(13, 'Paracetamol', '500mg', 'Thrice daily', '3 days', 'Hydration needed'),
(14, 'Diclofenac', '50mg', 'Twice daily', '5 days', 'Take with food'),
(15, 'Benadryl Syrup', '10ml', 'Twice daily', '5 days', 'Avoid driving'),
(16, 'Metformin', '500mg', 'Twice daily', 'Ongoing', 'After meals'),
(17, 'Clotrimazole Cream', 'Apply', 'Twice daily', '7 days', 'Avoid sun'),
(18, 'Valproate', '500mg', 'Twice daily', 'Long term', 'Routine EEG'),
(19, 'Naproxen', '250mg', 'Twice daily', '7 days', 'Avoid NSAIDs'),
(20, 'Calpol', '5ml', 'Thrice daily', '3 days', 'Pediatric dose'),
(21, 'Bisoprolol', '2.5mg', 'Once daily', '30 days', 'Monitor heart rate'),
(22, 'Salicylic acid', 'Apply', 'Once daily', '2 weeks', 'Avoid wounds'),
(23, 'Propranolol', '40mg', 'Twice daily', 'Ongoing', 'Track symptoms'),
(24, 'Vitamin D', '1000IU', 'Once daily', '30 days', 'With food'),
(25, 'Zinc Tablets', '50mg', 'Once daily', '7 days', 'Boost immunity')


INSERT INTO Billing (PatientID, AppointmentID, TotalAmount, PaymentStatus, PaymentDate) VALUES
(1, 1, 1500.00, 'Paid', '2025-06-25'),
(2, 2, 1000.00, 'Paid', '2025-06-25'),
(3, 3, 1800.00, 'Paid', '2025-06-26'),
(4, 4, 1200.00, 'Paid', '2025-06-26'),
(5, 5, 1000.00, 'Pending', NULL),
(6, 6, 1300.00, 'Paid', '2025-06-27'),
(7, 7, 900.00, 'Paid', '2025-06-28'),
(8, 8, 1600.00, 'Pending', NULL),
(9, 9, 1100.00, 'Cancelled', NULL),
(10, 10, 1400.00, 'Paid', '2025-06-29'),
(11, 11, 1550.00, 'Paid', '2025-06-30'),
(12, 12, 1000.00, 'Paid', '2025-06-30'),
(13, 13, 1800.00, 'Paid', '2025-07-01'),
(14, 14, 1250.00, 'Paid', '2025-07-01'),
(15, 15, 900.00, 'Paid', '2025-07-02'),
(16, 16, 2100.00, 'Cancelled', NULL),
(17, 17, 1000.00, 'Paid', '2025-07-03'),
(18, 18, 1700.00, 'Pending', NULL),
(19, 19, 1500.00, 'Paid', '2025-07-04'),
(20, 20, 950.00, 'Paid', '2025-07-04'),
(21, 21, 2000.00, 'Paid', '2025-07-05'),
(22, 22, 1150.00, 'Paid', '2025-07-05'),
(23, 23, 1900.00, 'Pending', NULL),
(24, 24, 1350.00, 'Paid', '2025-07-06'),
(25, 25, 1250.00, 'Paid', '2025-07-06')


select*from Patients
select*from Doctors
select*from Doctorschedule
select*from Appointments
select*from Prescriptions
select*from Billing


--1.list out the Patients  details

SELECT * FROM Patients

--2.Show the PatientID and BloodGroup from the Patients table

SELECT PatientID,BloodGroup FROM Patients

--3.Show the Firstname,Lastname and PhoneNumber who are all Caridiology specialist from the Doctors table
 
SELECT FirstName,LastName,PhoneNumber From Doctors
WHERE Specialty='Caridiology'

--4. list out the Doctors details who are all FirstName is Emily 
 
SELECT * FROM Doctors WHERE FirstName='Emily'

--5.Show the Patients details from the PatientID =25

SELECT * FROM Patients WHERE PatientID=25

--6. show the who are all DateOfBirth greater than year '1988' from the Patients

SELECT * FROM Patients WHERE year(DateOfBirth)>1988

--7. list out the Patients who are all DateOfBirth in 9,10,15 from the dates

SELECT * FROM Patients WHERE day(DateOfBirth)in(9,10,15)

--8.list out the TotalAmount in the billing table between 1000 to 1200 and order by descending

SELECT * FROM Billing WHERE TotalAmount BETWEEN 1000.00 into 1200.00
ORDER BY TotalAmount DESC
 
--9.list out the Prescriptions details which MedicationName starts from 'z'

SELECT * FROM Prescription WHERE MedicationName LIKE '%Z'

--10. show the Diagnosis from the MedicalRecords in the PatientID '24'

SELECT Diagnosis from MedicalRecords WHERE PatientID=24

--11.Display Doctor Specialty and PhoneNumber who are all doctorid=1 and RoomNumber=101A 

SELECT Specialty ,PhoneNumber FROM Doctors WHERE DoctorID=1 AND RoomNumber='101A'

--12.Display  the PatientID ,FirstName and BloodGroup who are all BloodGroup is A+ or B+

SELECT PatientID,FirstName ,BloodGroup FROM Patients WHERE BloodGroup='A+' or BloodGroup='B+' 

--13.Dispaly the Appointments details who are all not Scheduled  in the table  

SELECT* FROM Appointments WHERE NOT AppointmentStatus='Scheduled'

--14. Display the  Billing details who are all PaymentDate is NULL

SELECT *FROM Billing WHERE PaymentDate is NULL

--15.Show the highest amount of the Billing table 

SELECT MAX(TotalAmount) as TotalAmount from Billing 

--16.show the Average of the TotalAmount in the Billing Table

SELECT AVG(TotalAmount) as AverageAmount from Billing 

--17.Show the no of Patients in each BloodGroup

SELECT COUNT(PatientID) as No_Of_Patients ,BloodGroup FROM Patients
GROUP BY BloodGroup

--18.Calculate the Sum TotalAmount and Count the No Of BillID in the Billing Table.

SELECT COUNT(PatientID) as No_Of_Patients ,BloodGroup FROM Patients
GROUP BY BloodGroup

--19.Show the details of PatientId,FirstName ,LastName and Treatment in the table

SELECT A.PatientID,A.FirstName,A.LastName,D.Treatment FROM Patients AS A
JOIN MedicalRecords AS D on A.PatientID=D.PatientID


--20. Show the PatientId,FirstName,LastName,PaymentStatus who are all paid the BillAmount.

SELECT A.PatientID,A.FirstName,A.LastName,F.PaymentStatus FROM Patients
JOIN Billing AS F on A.PatientID=D.PatientID


--21.Show the  AppointmentDate and DoctorFirstName Who are all Patients FirstName is John

SELECT  A.FirstName AS PatientName,B.AppointmentDate,C.FirstName AS DoctorName FROM Patients AS A 
JOIN Appointments AS B on A.PatientID=B.PatientID
JOIN Doctors AS C on C.DoctorID=B.DoctorID
HAVING A.FirstName='John'

--22.Show PatientID,DoctorID and MedicationName who are all Medication Have Vitamin D and Salicylic acid

SELECT A.PatientID,A.DoctorID,B.MedicationName FROM MedicalRecords AS A
JOIN Prescriptions AS B on A.RecordID=B.RecordID
HAVING B.MedicationName IN('Vitamin D','Salicylic acid')

--23.Show the  PatientFullName,Gender,DoctorFullName, and AppointmentDate  Who are all have Appointments  between  '2025-06-25' to '2025-06-30' only female
Order BY Ascending

SELECT CONCAT(A.FirstName,A.LastName)AS PatientFullName, A.Gender,CONCAT(B.FirstName,B.LastName)AS DoctorFullName,
C.AppointmentDate  FROM Patients AS A
JOIN Appointments AS C on A.PatientID=C.PatientID
JOIN Doctors AS B ON B.DoctorID=C.DoctorID
HAVING C.AppointmentDate BETWEEN '2025-06-25' AND '2025-06-30' AND A.Gender='Female'
ORDER BY C.AppointmentDate ASC


--24.List all  Female MedicalRecords who are all DateOfBirth year range 1980 to 1990

SELECT  *FROM MedicalRecords AS A
JOIN Patients AS B ON A.PatientID=B.PatientID
HAVING B.Gender='Female' AND YEAR(B.DateOfBirth) BETWEEN '1980' AND '1990'

--25. In the Prescriptions Table  to add column NextAppointment in the Table

ALTER TABLE Prescriptions ADD NextAppointment DATE

--26.List Out the Billing Table if Bill is Paid show 'PAYMENT COMPLETE' then Pending or Cancelled to show 'PAYMENT NOT COMPLETE'

SELECT *,
CASE
WHEN PaymentStatus='Paid' THEN 'PAYMENT COMPLETE'
WHEN PaymentStatus='Pending' THEN 'PAYMENT NOT COMPLETE'
WHEN PaymentStatus='Cancelled' THEN 'PAYMENT NOT COMPLETE'
ELSE 'NULL'
END AS FinalStatus
FROM Billing;

--27.show TotalCounts of PaymentStatus Paid ,Pending, and Cancelled in Separate Columns	
DELIMITER $$
CREATE PROCEDURE GetBillingCount(OUT TotalPatients int)
BEGIN
SELECT COUNT(*) AS TotalPatients,
SUM(CASE WHEN PaymentStatus='Paid' THEN 1 ELSE 0 END)AS TotalPaid,
SUM(CASE WHEN PaymentStatus='Pending' THEN 1 ELSE 0 END)AS TotalPending,
SUM(CASE WHEN PaymentStatus='Cancelled' THEN 1 ELSE 0 END)AS TotalCancelled
FROM Billing;
END 
$$ DELIMITER 

call GetBillingCount(@TotalPatients);






