-- create university database--------
create database university;
drop database university;
use university;
-- 1. craete table student------
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    enrollment_date DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT
);
select * from students;

INSERT INTO students (first_name, last_name, date_of_birth, gender, enrollment_date, email, phone, address)
VALUES 
('John', 'Doe', '2000-05-15', 'Male', '2023-09-01', 'john.doe@email.com', '555-1234', '123 Elm St, Springfield, IL'),
('Jane', 'Smith', '1999-11-22', 'Female', '2022-08-10', 'jane.smith@email.com', '555-5678', '456 Oak St, Springfield, IL'),
('Michael', 'Johnson', '2001-02-10', 'Male', '2023-01-15', 'michael.johnson@email.com', '555-8765', '789 Pine St, Springfield, IL'),
('Emily', 'Williams', '2000-07-25', 'Female', '2021-09-12', 'emily.williams@email.com', '555-4321', '321 Maple St, Springfield, IL'),
('David', 'Brown', '1998-03-30', 'Male', '2022-05-20', 'david.brown@email.com', '555-1122', '654 Birch St, Springfield, IL'),
('Sophia', 'Davis', '2000-08-05', 'Female', '2023-04-01', 'sophia.davis@email.com', '555-3344', '987 Cedar St, Springfield, IL'),
('James', 'Miller', '1999-12-18', 'Male', '2021-11-23', 'james.miller@email.com', '555-5566', '234 Willow St, Springfield, IL'),
('Isabella', 'Garcia', '2001-06-30', 'Female', '2022-07-19', 'isabella.garcia@email.com', '555-7788', '567 Redwood St, Springfield, IL'),
('William', 'Martinez', '2000-04-12', 'Male', '2023-10-10', 'william.martinez@email.com', '555-9900', '890 Pine St, Springfield, IL'),
('Olivia', 'Rodriguez', '2000-01-20', 'Female', '2022-02-05', 'olivia.rodriguez@email.com', '555-2233', '345 Fir St, Springfield, IL');


-- 2. professors table.....

CREATE TABLE professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    email VARCHAR(100),
    phone VARCHAR(15),
    hire_date DATE
    
);
INSERT INTO professors (first_name, last_name, department_id, email, phone, hire_date)
VALUES
('Dr. John', 'Doe', 1, 'john.doe@university.edu', '555-1234', '2015-08-20'),
('Dr. Jane', 'Smith', 2, 'jane.smith@university.edu', '555-5678', '2016-09-15'),
('Dr. Michael', 'Johnson', 3, 'michael.johnson@university.edu', '555-8765', '2017-01-10'),
('Dr. Emily', 'Williams', 1, 'emily.williams@university.edu', '555-4321', '2018-05-25'),
('Dr. David', 'Brown', 4, 'david.brown@university.edu', '555-1122', '2019-06-30'),
('Dr. Sophia', 'Davis', 2, 'sophia.davis@university.edu', '555-3344', '2020-07-12'),
('Dr. James', 'Miller', 3, 'james.miller@university.edu', '555-5566', '2021-03-03'),
('Dr. Isabella', 'Garcia', 4, 'isabella.garcia@university.edu', '555-7788', '2022-01-15'),
('Dr. William', 'Martinez', 5, 'william.martinez@university.edu', '555-9900', '2023-02-25'),
('Dr. Olivia', 'Rodriguez', 5, 'olivia.rodriguez@university.edu', '555-2233', '2024-04-05');




-- 3. courses
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    course_code VARCHAR(10),
    department_id INT,
    credits INT,
    semester VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO courses (course_name, course_code, department_id, credits, semester)
VALUES
('Introduction to Computer Science', 'CS101', 1, 3, 'Fall'),
('Calculus I', 'MATH101', 2, 4, 'Spring'),
('Modern Physics', 'PHYS101', 3, 3, 'Fall'),
('Organic Chemistry', 'CHEM101', 4, 3, 'Spring'),
('Introduction to Biology', 'BIO101', 5, 3, 'Fall'),
('Data Structures', 'CS201', 1, 3, 'Spring'),
('Linear Algebra', 'MATH201', 2, 4, 'Fall'),
('Quantum Mechanics', 'PHYS201', 3, 3, 'Spring'),
('Inorganic Chemistry', 'CHEM201', 4, 3, 'Fall'),
('Genetics', 'BIO201', 5, 3, 'Spring');
select * from courses;

-- 4. departments


CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100),
    department_head INT,
    FOREIGN KEY (department_head) REFERENCES professors(professor_id)
);
INSERT INTO departments (department_name, department_head)
VALUES
('Computer Science', 1),  -- Professor with professor_id 1 is the head of Computer Science
('Mathematics', 2),       -- Professor with professor_id 2 is the head of Mathematics
('Physics', 3),           -- Professor with professor_id 3 is the head of Physics
('Chemistry', 4),         -- Professor with professor_id 4 is the head of Chemistry
('Biology', 5),           -- Professor with professor_id 5 is the head of Biology
('Electrical Engineering', 6),  -- Professor with professor_id 6 is the head of Electrical Engineering
('Mechanical Engineering', 7),  -- Professor with professor_id 7 is the head of Mechanical Engineering
('Civil Engineering', 8),      -- Professor with professor_id 8 is the head of Civil Engineering
('Psychology', 9),           -- Professor with professor_id 9 is the head of Psychology
('Philosophy', 10);          -- Professor with professor_id 10 is the head of Philosophy
select * from departments;
-- 5. enrollments

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES
(1, 1, '2023-09-01', 'A'),
(2, 2, '2022-08-10', 'B'),
(3, 3, '2023-01-15', 'A'),
(4, 4, '2021-09-12', 'C'),
(5, 5, '2022-05-20', 'B'),
(6, 6, '2023-04-01', 'A'),
(7, 7, '2021-11-23', 'A'),
(8, 8, '2022-07-19', 'B'),
(9, 9, '2023-10-10', 'C'),
(10, 10, '2022-02-05', 'B');
select * from enrollments;

-- 6. classrooms

CREATE TABLE classrooms (
    classroom_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10),
    building_name VARCHAR(100),
    capacity INT
);

INSERT INTO classrooms (room_number, building_name, capacity)
VALUES
('101', 'Building A', 30),
('102', 'Building A', 40),
('201', 'Building B', 50),
('202', 'Building B', 60),
('301', 'Building C', 35),
('302', 'Building C', 45),
('401', 'Building D', 25),
('402', 'Building D', 40),
('501', 'Building E', 20),
('502', 'Building E', 30);

select * from classrooms;

-- 7. schedule

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    classroom_id INT,
    day_of_week VARCHAR(10),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(classroom_id)
);

INSERT INTO schedule (course_id, classroom_id, day_of_week, start_time, end_time)
VALUES
(1, 1, 'Monday', '09:00:00', '12:00:00'),  -- CS101 in Building A, Room 101 on Monday
(2, 2, 'Tuesday', '10:00:00', '13:00:00'),  -- MATH101 in Building A, Room 102 on Tuesday
(3, 3, 'Wednesday', '11:00:00', '14:00:00'),  -- PHYS101 in Building B, Room 201 on Wednesday
(4, 4, 'Thursday', '09:00:00', '12:00:00'),  -- CHEM101 in Building B, Room 202 on Thursday
(5, 5, 'Friday', '14:00:00', '17:00:00'),  -- BIO101 in Building C, Room 301 on Friday
(6, 6, 'Monday', '15:00:00', '18:00:00'),  -- CS201 in Building C, Room 302 on Monday
(7, 7, 'Wednesday', '08:00:00', '11:00:00'),  -- MATH201 in Building D, Room 401 on Wednesday
(8, 8, 'Tuesday', '13:00:00', '16:00:00'),  -- PHYS201 in Building D, Room 402 on Tuesday
(9, 9, 'Thursday', '10:00:00', '13:00:00'),  -- CHEM201 in Building E, Room 501 on Thursday
(10, 10, 'Friday', '12:00:00', '15:00:00');  -- BIO201 in Building E, Room 502 on Friday

select * from schedule;

-- 8. assignments

CREATE TABLE assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    title VARCHAR(100),
    due_date DATE,
    description TEXT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO assignments (course_id, title, due_date, description)
VALUES
(1, 'Final Project', '2023-12-15', 'Complete a project related to computer algorithms. Submit a report and a working prototype.'),
(2, 'Midterm Exam', '2023-10-10', 'Complete the midterm exam covering calculus topics up to integration techniques.'),
(3, 'Lab Report', '2023-11-05', 'Write a lab report on the experiments conducted in Modern Physics.'),
(4, 'Research Paper', '2023-11-20', 'Submit a research paper on the latest developments in organic chemistry.'),
(5, 'Group Presentation', '2023-12-01', 'Prepare a group presentation on ecological conservation methods for the final exam.'),
(6, 'Homework Assignment 1', '2023-09-25', 'Solve the first set of problems on data structures and algorithms.'),
(7, 'Homework Assignment 2', '2023-10-05', 'Complete exercises related to matrix operations and linear algebra concepts.'),
(8, 'Essay on Quantum Physics', '2023-11-15', 'Write a 5-page essay on the implications of quantum mechanics in modern technology.'),
(9, 'Lab Exercise', '2023-10-20', 'Complete the lab exercise on titration and submit the results.'),
(10, 'Genetics Report', '2023-12-10', 'Write a report discussing genetic modification techniques and their applications.');

select * from assignments;

-- 9. grades
CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    assignment_id INT,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id)
);
INSERT INTO grades (student_id, assignment_id, grade)
VALUES
(1, 1, 'A'),  -- Student 1 got an A in Assignment 1
(2, 2, 'B+'), -- Student 2 got a B+ in Assignment 2
(3, 3, 'A-'), -- Student 3 got an A- in Assignment 3
(4, 4, 'C'),  -- Student 4 got a C in Assignment 4
(5, 5, 'B'),  -- Student 5 got a B in Assignment 5
(6, 6, 'A'),  -- Student 6 got an A in Assignment 6
(7, 7, 'B-'), -- Student 7 got a B- in Assignment 7
(8, 8, 'A+'), -- Student 8 got an A+ in Assignment 8
(9, 9, 'C+'), -- Student 9 got a C+ in Assignment 9
(10, 10, 'B'); -- Student 10 got a B in Assignment 10
select * from grades;

-- 10. student_attendance

CREATE TABLE student_attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO student_attendance (student_id, course_id, date, status)
VALUES
(1, 1, '2023-09-01', 'Present'),   -- Student 1 was present in CS101 on 2023-09-01
(2, 2, '2023-09-05', 'Absent'),    -- Student 2 was absent in MATH101 on 2023-09-05
(3, 3, '2023-09-07', 'Late'),      -- Student 3 was late in PHYS101 on 2023-09-07
(4, 4, '2023-09-08', 'Present'),   -- Student 4 was present in CHEM101 on 2023-09-08
(5, 5, '2023-09-10', 'Absent'),    -- Student 5 was absent in BIO101 on 2023-09-10
(6, 6, '2023-09-11', 'Present'),   -- Student 6 was present in CS201 on 2023-09-11
(7, 7, '2023-09-12', 'Late'),      -- Student 7 was late in MATH201 on 2023-09-12
(8, 8, '2023-09-14', 'Present'),   -- Student 8 was present in PHYS201 on 2023-09-14
(9, 9, '2023-09-16', 'Absent'),    -- Student 9 was absent in CHEM201 on 2023-09-16
(10, 10, '2023-09-20', 'Present'); -- Student 10 was present in BIO201 on 2023-09-20
 select * from student_attendance;
-- 11. student_fees

CREATE TABLE student_fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(10, 2),
    due_date DATE,
    paid_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO student_fees (student_id, amount, due_date, paid_date)
VALUES
(1, 500.00, '2023-09-01', '2023-09-05'),  -- Student 1 fee of 500 paid on 2023-09-05
(2, 300.00, '2023-09-10', '2023-09-12'),  -- Student 2 fee of 300 paid on 2023-09-12
(3, 400.00, '2023-09-15', '2023-09-16'),  -- Student 3 fee of 400 paid on 2023-09-16
(4, 350.00, '2023-09-20', NULL),          -- Student 4 fee of 350 not yet paid
(5, 450.00, '2023-09-25', '2023-09-27'),  -- Student 5 fee of 450 paid on 2023-09-27
(6, 200.00, '2023-10-01', '2023-10-03'),  -- Student 6 fee of 200 paid on 2023-10-03
(7, 600.00, '2023-10-05', '2023-10-06'),  -- Student 7 fee of 600 paid on 2023-10-06
(8, 250.00, '2023-10-10', '2023-10-12'),  -- Student 8 fee of 250 paid on 2023-10-12
(9, 500.00, '2023-10-15', NULL),          -- Student 9 fee of 500 not yet paid
(10, 550.00, '2023-10-20', '2023-10-21'); -- Student 10 fee of 550 paid on 2023-10-21
 select * from student_fees;
-- 12. staff

CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role VARCHAR(100),
    department_id INT,
    email VARCHAR(100),
    phone VARCHAR(15),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO staff (first_name, last_name, role, department_id, email, phone, hire_date)
VALUES
('John', 'Doe', 'Administrator', 1, 'john.doe@university.edu', '123-456-7890', '2018-06-15'),
('Jane', 'Smith', 'IT Support', 2, 'jane.smith@university.edu', '987-654-3210', '2019-03-22'),
('Mark', 'Johnson', 'Academic Advisor', 3, 'mark.johnson@university.edu', '555-123-4567', '2017-11-30'),
('Emily', 'Davis', 'Registrar', 4, 'emily.davis@university.edu', '444-555-6666', '2020-01-10'),
('Michael', 'Wilson', 'IT Technician', 2, 'michael.wilson@university.edu', '321-654-9870', '2021-08-17'),
('Sarah', 'Martinez', 'Library Staff', 5, 'sarah.martinez@university.edu', '555-789-0123', '2022-04-20'),
('David', 'Taylor', 'Security Staff', 6, 'david.taylor@university.edu', '333-444-5555', '2020-07-25'),
('Linda', 'Moore', 'Academic Coordinator', 3, 'linda.moore@university.edu', '888-999-0000', '2019-12-05'),
('James', 'Brown', 'Custodian', 7, 'james.brown@university.edu', '777-666-5555', '2021-02-28'),
('Susan', 'Williams', 'HR Manager', 8, 'susan.williams@university.edu', '666-777-8888', '2018-09-11');

select * from staff;

-- 13. research_projects

CREATE TABLE research_projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    department_id INT,
    project_lead INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (project_lead) REFERENCES professors(professor_id)
);
INSERT INTO research_projects (project_name, department_id, project_lead, start_date, end_date)
VALUES
('AI in Education', 1, 1, '2023-05-01', '2025-05-01'),  -- AI in Education project led by Professor 1 in Department 1
('Quantum Computing Advancements', 2, 2, '2023-06-15', '2026-06-15'),  -- Quantum Computing project led by Professor 2 in Department 2
('Sustainable Energy Solutions', 3, 3, '2023-07-01', '2025-12-31'),  -- Sustainable Energy project led by Professor 3 in Department 3
('Nanotechnology in Medicine', 4, 4, '2023-09-01', '2027-09-01'),  -- Nanotechnology project led by Professor 4 in Department 4
('Genetic Engineering Research', 5, 5, '2023-08-15', '2026-08-15'),  -- Genetic Engineering project led by Professor 5 in Department 5
('Climate Change and Agriculture', 6, 6, '2023-10-01', '2026-10-01'),  -- Climate Change project led by Professor 6 in Department 6
('Robotics for Healthcare', 7, 7, '2023-11-01', '2025-11-01'),  -- Robotics in Healthcare project led by Professor 7 in Department 7
('Astrophysics and Cosmology', 8, 8, '2023-12-01', '2027-12-01'),  -- Astrophysics project led by Professor 8 in Department 8
('Cybersecurity in Cloud Computing', 1, 9, '2024-01-01', '2026-01-01'),  -- Cybersecurity project led by Professor 9 in Department 1
('Blockchain for Finance', 2, 10, '2024-02-01', '2026-02-01');  -- Blockchain project led by Professor 10 in Department 2
select * from research_projects;

--  14. student_internships

CREATE TABLE student_internships (
    internship_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    company_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    position VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO student_internships (student_id, company_name, start_date, end_date, position)
VALUES
(1, 'Google', '2023-06-01', '2023-08-31', 'Software Engineering Intern'),
(2, 'Microsoft', '2023-05-15', '2023-08-15', 'Data Analyst Intern'),
(3, 'Tesla', '2023-06-15', '2023-09-15', 'Mechanical Engineering Intern'),
(4, 'Amazon', '2023-07-01', '2023-09-30', 'Operations Intern'),
(5, 'Facebook', '2023-06-20', '2023-09-20', 'Product Management Intern'),
(6, 'IBM', '2023-05-01', '2023-07-31', 'Cybersecurity Intern'),
(7, 'Apple', '2023-06-10', '2023-09-10', 'Business Analyst Intern'),
(8, 'Intel', '2023-07-01', '2023-09-01', 'Electrical Engineering Intern'),
(9, 'Netflix', '2023-05-25', '2023-08-25', 'Marketing Intern'),
(10, 'Spotify', '2023-06-01', '2023-08-31', 'UX/UI Design Intern');

select * from student_internships;

-- 15. library_books

CREATE TABLE library_books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    author VARCHAR(100),
    isbn VARCHAR(20),
    publication_year INT,
    available_copies INT
);
INSERT INTO library_books (title, author, isbn, publication_year, available_copies)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925, 5),
('1984', 'George Orwell', '9780451524935', 1949, 8),
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 1960, 6),
('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 1951, 4),
('Moby Dick', 'Herman Melville', '9781503280786', 1851, 3),
('Pride and Prejudice', 'Jane Austen', '9780141439518', 1813, 7),
('The Hobbit', 'J.R.R. Tolkien', '9780547928227', 1937, 10),
('War and Peace', 'Leo Tolstoy', '9781400079988', 1869, 2),
('Brave New World', 'Aldous Huxley', '9780060850524', 1932, 9),
('The Odyssey', 'Homer', '9780140268867', -800, 6);
select * from library_books;

-- 16. book_loans

CREATE TABLE book_loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (book_id) REFERENCES library_books(book_id)
);
INSERT INTO book_loans (student_id, book_id, loan_date, due_date, return_date)
VALUES
(1, 1, '2023-05-10', '2023-06-10', '2023-06-05'),
(2, 2, '2023-06-15', '2023-07-15', NULL),  -- Not yet returned
(3, 3, '2023-07-01', '2023-08-01', '2023-07-28'),
(4, 4, '2023-08-10', '2023-09-10', '2023-09-05'),
(5, 5, '2023-08-20', '2023-09-20', NULL),  -- Not yet returned
(6, 6, '2023-05-22', '2023-06-22', '2023-06-15'),
(7, 7, '2023-09-05', '2023-10-05', NULL),  -- Not yet returned
(8, 8, '2023-09-10', '2023-10-10', '2023-10-05'),
(9, 9, '2023-06-25', '2023-07-25', '2023-07-20'),
(10, 10, '2023-07-12', '2023-08-12', '2023-08-05');
select * from  book_loans;

-- 17. scholarships

CREATE TABLE scholarships (
    scholarship_id INT PRIMARY KEY AUTO_INCREMENT,
    scholarship_name VARCHAR(100),
    amount DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO scholarships (scholarship_name, amount, department_id)
VALUES
('Merit-Based Scholarship', 1500.00, 1),
('Research Grant for Engineering', 2000.00, 2),
('Art and Design Excellence Award', 1000.00, 3),
('STEM Scholarship', 1800.00, 4),
('Business Leadership Scholarship', 2200.00, 5),
('Medical Studies Scholarship', 2500.00, 6),
('Literature Fellowship', 1200.00, 7),
('Environmental Science Grant', 1600.00, 8),
('International Study Scholarship', 3000.00, 1),
('Innovation in Technology Scholarship', 2000.00, 2);
select * from scholarships;
-- 18. student_scholarships

CREATE TABLE student_scholarships (
    scholarship_id INT,
    student_id INT,
    amount DECIMAL(10, 2),
    PRIMARY KEY (scholarship_id, student_id),
    FOREIGN KEY (scholarship_id) REFERENCES scholarships(scholarship_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO student_scholarships (scholarship_id, student_id, amount)
VALUES
(1, 1, 1500.00),  -- Student 1 receives the Merit-Based Scholarship
(2, 2, 2000.00),  -- Student 2 receives the Research Grant for Engineering
(3, 3, 1000.00),  -- Student 3 receives the Art and Design Excellence Award
(4, 4, 1800.00),  -- Student 4 receives the STEM Scholarship
(5, 5, 2200.00),  -- Student 5 receives the Business Leadership Scholarship
(6, 6, 2500.00),  -- Student 6 receives the Medical Studies Scholarship
(7, 7, 1200.00),  -- Student 7 receives the Literature Fellowship
(8, 8, 1600.00),  -- Student 8 receives the Environmental Science Grant
(9, 9, 3000.00),  -- Student 9 receives the International Study Scholarship
(10, 10, 2000.00); -- Student 10 receives the Innovation in Technology Scholarship
select * from student_scholarships ;

-- 19. exams

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    exam_type VARCHAR(50),
    exam_date DATE,
    total_marks INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO exams (course_id, exam_type, exam_date, total_marks)
VALUES
(1, 'Mid-Term', '2023-10-10', 100),
(2, 'Final', '2023-12-15', 150),
(3, 'Quiz', '2023-09-20', 50),
(4, 'Mid-Term', '2023-10-15', 80),
(5, 'Final', '2023-12-10', 120),
(6, 'Mid-Term', '2023-10-05', 100),
(7, 'Quiz', '2023-09-25', 40),
(8, 'Final', '2023-12-12', 150),
(9, 'Mid-Term', '2023-10-08', 90),
(10, 'Final', '2023-12-20', 130);
select * from exams;

-- 20. exam_results

CREATE TABLE exam_results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    exam_id INT,
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);
INSERT INTO exam_results (student_id, exam_id, marks_obtained)
VALUES
(1, 1, 85),  -- Student 1, Exam 1 (Mid-Term), obtained 85 marks
(2, 2, 120), -- Student 2, Exam 2 (Final), obtained 120 marks
(3, 3, 40),  -- Student 3, Exam 3 (Quiz), obtained 40 marks
(4, 4, 75),  -- Student 4, Exam 4 (Mid-Term), obtained 75 marks
(5, 5, 110), -- Student 5, Exam 5 (Final), obtained 110 marks
(6, 6, 90),  -- Student 6, Exam 6 (Mid-Term), obtained 90 marks
(7, 7, 35),  -- Student 7, Exam 7 (Quiz), obtained 35 marks
(8, 8, 145), -- Student 8, Exam 8 (Final), obtained 145 marks
(9, 9, 80),  -- Student 9, Exam 9 (Mid-Term), obtained 80 marks
(10, 10, 125); -- Student 10, Exam 10 (Final), obtained 125 marks
select * from exam_results;

-- 21. hostels

CREATE TABLE hostels (
    hostel_id INT PRIMARY KEY AUTO_INCREMENT,
    hostel_name VARCHAR(100),
    building_name VARCHAR(100),
    capacity INT
);
INSERT INTO hostels (hostel_name, building_name, capacity)
VALUES
('Sunset Hostel', 'Building A', 200),
('Maple Residence', 'Building B', 150),
('Eagle Heights', 'Building C', 180),
('Pine Grove Hostel', 'Building D', 220),
('Oceanview Dorm', 'Building E', 250),
('Greenfield Hostel', 'Building F', 180),
('Redwood Residence', 'Building G', 170),
('Lakeview Hostel', 'Building H', 160),
('Mountain Retreat', 'Building I', 140),
('Hilltop Hostel', 'Building J', 190);
select * from hostels;

-- 22. student_hostel_assignments

CREATE TABLE student_hostel_assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    hostel_id INT,
    room_number VARCHAR(10),
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id)
);
INSERT INTO student_hostel_assignments (student_id, hostel_id, room_number, check_in_date, check_out_date)
VALUES
(1, 1, 'A101', '2023-09-01', '2023-12-01'),
(2, 2, 'B202', '2023-09-05', '2023-12-05'),
(3, 3, 'C303', '2023-09-10', NULL),  -- Still staying
(4, 4, 'D404', '2023-09-12', '2023-12-12'),
(5, 5, 'E505', '2023-09-15', '2023-12-15'),
(6, 6, 'F606', '2023-09-20', '2023-12-20'),
(7, 7, 'G707', '2023-09-25', NULL),  -- Still staying
(8, 8, 'H808', '2023-09-30', '2023-12-30'),
(9, 9, 'I909', '2023-10-05', '2023-12-05'),
(10, 10, 'J1010', '2023-10-10', '2023-12-10');
select * from student_hostel_assignments;

-- 23. events

CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100),
    event_date DATE,
    event_location VARCHAR(100)
);
INSERT INTO events (event_name, event_date, event_location)
VALUES
('Annual Sports Day', '2023-10-15', 'Main Stadium'),
('Freshers Party', '2023-09-20', 'Auditorium'),
('Tech Symposium', '2023-11-05', 'Conference Hall'),
('Cultural Festival', '2023-12-01', 'University Grounds'),
('Inter-College Debate', '2023-10-25', 'Lecture Hall A'),
('Music Concert', '2023-10-30', 'Main Auditorium'),
('Workshop on AI', '2023-09-15', 'Science Building'),
('University Open Day', '2023-11-10', 'Campus Grounds'),
('Charity Run', '2023-12-05', 'City Park'),
('Graduation Ceremony', '2023-12-15', 'Graduation Hall');
select * from events;

-- 24. student_events

CREATE TABLE student_events (
    event_id INT,
    student_id INT,
    PRIMARY KEY (event_id, student_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);INSERT INTO student_events (event_id, student_id)
VALUES
(1, 1),  -- Student 1 attends the Annual Sports Day
(2, 2),  -- Student 2 attends the Freshers Party
(3, 3),  -- Student 3 attends the Tech Symposium
(4, 4),  -- Student 4 attends the Cultural Festival
(5, 5),  -- Student 5 attends the Inter-College Debate
(6, 6),  -- Student 6 attends the Music Concert
(7, 7),  -- Student 7 attends the Workshop on AI
(8, 8),  -- Student 8 attends the University Open Day
(9, 9),  -- Student 9 attends the Charity Run
(10, 10); -- Student 10 attends the Graduation Ceremony
select * from student_events;


-- 25. alumni

CREATE TABLE alumni (
    alumni_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    graduation_year INT,
    current_position VARCHAR(100),
    current_company VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);INSERT INTO alumni (student_id, graduation_year, current_position, current_company)
VALUES
(1, 2022, 'Software Engineer', 'Tech Innovations Ltd.'),
(2, 2021, 'Data Analyst', 'DataWorks Inc.'),
(3, 2020, 'Project Manager', 'Global Enterprises'),
(4, 2023, 'Marketing Lead', 'Brand Solutions'),
(5, 2022, 'Financial Analyst', 'Finance Partners'),
(6, 2021, 'HR Manager', 'PeopleFirst Solutions'),
(7, 2020, 'Business Consultant', 'Consultancy Group'),
(8, 2023, 'Research Scientist', 'Innovative Labs'),
(9, 2022, 'Graphic Designer', 'Creative Studios'),
(10, 2021, 'Product Manager', 'ProductX Technologies');
select * from alumni;
show tables from university;


