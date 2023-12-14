-- USE CASE 1: Ability to create a Address Book Service
CREATE DATABASE address_book_db;
USE address_book_db;

-- USE CASE 2: create a Address Book Table
CREATE TABLE address_book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip VARCHAR(20),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- USE CASE 3: Ability to insert contacts
INSERT INTO address_book (first_name, last_name, address, city, state, zip, phone_number, email)
VALUES
    ('Rajesh', 'Singh', '789 Tulip Street', 'Bangalore', 'KA', '560099',  '98765-67890', 'rajesh.singh@email.com'),
    ('Neha', 'Gupta', '789 Orchid Avenue', 'Bangalore', 'KA', '560002', '87654-10987', 'neha.gupta@email.com'),
    ('Anup', 'Rao', '567 Jasmine Street', 'Hyderabad', 'TS', '500001', '87654-32109', 'anup.rao@email.com'),
    ('Anita', 'Gupta', '123 Jasmine Lane', 'Hyderabad', 'TS', '500001', '87654-98765', 'anita.gupta@email.com'),
    ('Chavan', 'Yadav', '456 Sunflower Road', 'Pune', 'MH', '411001', '78901-34567', 'c.yadav@email.com');
    
-- USE CASE 4: Edit existing contact person using their name
UPDATE address_book
SET address = '126 AGC',
    city = 'Bangalore',
    state = 'KA',
    zip = '560012',
    phone_number = '99887-76655',
    email = 'rsingh.email@email.com'
WHERE first_name = 'Rajesh' AND last_name = 'Singh';

-- USE CASE 5: Delete a person using person's name
DELETE FROM address_book
WHERE first_name = 'Chavan' AND last_name = 'Yadav';

-- USE CASE 6: 
-- Retrieve Person belonging to a City
SELECT *
FROM address_book
WHERE city = 'Hyderabad';

-- Retrieve Person belonging to a State
SELECT *
FROM address_book
WHERE state = 'TS';

-- USE CASE 7: Size of address book by City and State
SELECT city, state, COUNT(*) AS address_book_size
FROM address_book
GROUP BY city, state;

-- USE CASE 8: Retrieve entries sorted alphabetically by Person’s name for a given city
SELECT *
FROM address_book
WHERE city = 'Bangalore'
ORDER BY first_name, last_name;

-- USE CASE 9: Ability to identify each Address Book with name and Type.
ALTER TABLE address_book
ADD COLUMN name VARCHAR(100),
ADD COLUMN type VARCHAR(50);
-- Update existing entries with name and type
UPDATE address_book
SET name = 'Rajesh Singh', type = 'Family'
WHERE first_name = 'Rajesh' AND last_name = 'Singh';

UPDATE address_book
SET name = 'Neha Gupta', type = 'Friend'
WHERE first_name = 'Neha' AND last_name = 'Gupta';

UPDATE address_book
SET name = 'Anup Rao', type = 'Family'
WHERE first_name = 'Anup' AND last_name = 'Rao';

UPDATE address_book
SET name = 'Anita Gupta', type = 'Profession'
WHERE first_name = 'Anita' AND last_name = 'Gupta';

-- USE CASE 10: Get number of contact persons by type
SELECT type, COUNT(*) AS contact_count
FROM address_book
GROUP BY type;

-- USE CASE 11: Ability to add person to both Friend and Family
-- Inserting into "Friends"
INSERT INTO address_book (first_name, last_name, address, city, state, zip, phone_number, email, name, type)
VALUES
    ('John', 'Doe', '123 Main St', 'Bandra', 'MH', '400050', '99112-00223', 'john.doe@email.com', 'John Doe', 'Friends');

-- Inserting into "Family"
INSERT INTO address_book (first_name, last_name, address, city, state, zip, phone_number, email, name, type)
VALUES
    ('John', 'Doe', '123 Main St', 'Bandra', 'MH', '400050', '99112-00223', 'john.doe@email.com', 'John Doe', 'Family');

