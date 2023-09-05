--Insert sample data into AdministrativeLevel
INSERT INTO AdministrativeLevel (role)
VALUES
    ('Admin'),
    ('Company_Representative'),
    ('Teacher'),
    ('Candidate');
    ('AdmittedCandidate'),
    ('Administrative'),
    ('EducationManager'),
    

-- Insert sample data into SchoolSubject table
INSERT INTO SchoolSubject (title, description, credit)
VALUES
    ('Mathematics', 'Advanced mathematics course', 4),
    ('Computer Science', 'Introduction to computer programming', 3),
    ('Physics', 'Basic principles of physics', 3);

-- Insert sample data into TrainingCourse table
INSERT INTO TrainingCourse (title, description, duration)
VALUES
    ('Web Development', 'Learn web development technologies', 12),
    ('Data Science', 'Introduction to data analysis and machine learning', 8),
    ('Digital Marketing', 'Master digital marketing strategies', 6);
    ('Web Development', 'Learn web development technologies', 12),
    ('Data Science', 'Introduction to data analysis and machine learning', 8),
    ('Digital Marketing', 'Master digital marketing strategies', 6);

-- Insert sample data into RegisteredUser table
INSERT INTO RegisteredUser (email, first_name, last_name, birth_date, password, phone_number)
VALUES
    ('john@example.com', 'John', 'Doe', UNIX_TIMESTAMP('1990-05-15'), 'password123', '1234567890'),
    ('jane@example.com', 'Jane', 'Smith', UNIX_TIMESTAMP('1992-09-20'), 'pass456', '9876543210'),
    ('alice@example.com', 'Alice', 'Johnson', UNIX_TIMESTAMP('1988-12-31'), 'pass789', '4567891230'),
    ('bob@example.com', 'Bob', 'Williams', UNIX_TIMESTAMP('1994-06-25'), 'pass012', '3216549870'),
    ('emma@example.com', 'Emma', 'Brown', UNIX_TIMESTAMP('1997-03-18'), 'pass345', '9873216540'),
    ('michael@example.com', 'Michael', 'Davis', UNIX_TIMESTAMP('1991-08-22'), 'pass678', '6549873210'),
    ('sophia@example.com', 'Sophia', 'Miller', UNIX_TIMESTAMP('1995-11-12'), 'pass901', '3210987650'),
    ('alex@example.com', 'Alex', 'Wilson', UNIX_TIMESTAMP('1993-02-07'), 'pass234', '6540129870'),
    ('olivia@example.com', 'Olivia', 'Thompson', UNIX_TIMESTAMP('1998-09-02'), 'pass567', '9870123450'),
    ('william@example.com', 'William', 'Jones', UNIX_TIMESTAMP('1996-04-09'), 'pass890', '6543210980');

-- Insert sample data into Company table
INSERT INTO Company (name, business_sector, size)
VALUES
    ('ABC Company', 'IT Services', 'Large'),
    ('XYZ Corporation', 'Finance', 'Medium'),
    ('Z Corporation', 'Game', 'Small');

-- Insert sample data into CompanyOffer table
INSERT INTO CompanyOffer (duration, start_date, required_degree_level, title, description, id_registered_user)
VALUES
    (6, UNIX_TIMESTAMP('2023-06-01'), 'Bachelor', 'Software Developer', 'Develop web applications', 1),
    (12, UNIX_TIMESTAMP('2023-07-01'), 'Master', 'Data Analyst', 'Analyzing and visualizing data', 2);

-- Insert sample data into CompanyRepresentative 
-- Note: The id_registered_user values are the id of the RegisteredUser
-- the id_company values are the id of the Company 
INSERT INTO CompanyRepresentative (id_registered_user, id_company)
VALUES (1, 1),
       (2, 2),
       (3, 3);

-- Insert sample data into Teacher table
INSERT INTO Teacher (id_registered_user)
VALUES
    (3),
    (4);

-- Insert sample data into Candidate table
INSERT INTO Candidate (id_registered_user, ine_number, last_degree, work_experiences, gender, skills)
VALUES
    (5, 123456, 'Bachelor of Science', 'Internship at ABC Company', 'M', 'Programming, Problem-solving'),
    (6, 789012, 'Master of Business Administration', '2 years as a marketing assistant', 'F', 'Marketing, Analytics'),
    (7, 345678, 'Bachelor of Engineering', 'Freelance web developer', 'M', 'Web Development, UI/UX Design'),
    (8, 901234, 'Bachelor of Arts', 'Customer service representative', 'F', 'Communication, Problem-solving'),
    (9, 567890, 'Master of Science', 'Research assistant at university', 'M', 'Data Analysis, Statistics'),
    (10, 234567, 'Bachelor of Business Administration', 'Marketing intern at a startup', 'F', 'Digital Marketing, Social Media');

-- Insert sample data into AdmittedCandidate table
-- Note: The internal_email values are the email addresses of the admitted candidates
-- the id_registered_user values are the id of the Candidate
INSERT INTO AdmittedCandidate (id_registered_user, internal_email)
VALUES
    (5, 'john@example.com'),
    (6, 'jane@example.com'),
    (7, 'alice@example.com');

-- Insert sample data into Application table
INSERT INTO Application (application_date, status)
VALUES
    (UNIX_TIMESTAMP('2022-05-26'), 'Submitted'),
    (UNIX_TIMESTAMP('2022-06-05'), 'In Review'),
    (UNIX_TIMESTAMP('2022-06-15'), 'Rejected');

-- Insert sample data into Apply table
INSERT INTO Apply (id_registered_user, id_application)
VALUES (5, 1),
       (6, 2),
       (7, 3);

-- Insert sample data into Video table
INSERT INTO Video (url, id_application)
VALUES ('video1_url', 1),
       ('video2_url', 2),
       ('video3_url', 3);

-- Insert sample data into CoverLetter table
INSERT INTO CoverLetter (url, id_application)
VALUES ('cover_letter1_url', 1),
       ('cover_letter2_url', 2),
       ('cover_letter3_url', 3);

-- Insert sample data into Administrative table
INSERT INTO Administrative (id_registered_user)
VALUES
    (1),
    (2);

-- Insert sample data into EducationManager table
INSERT INTO EducationManager (id_registered_user)
VALUES
    (3),
    (4);

-- Insert sample data into RecruitmentSession table
-- Note: The start_date and end_date values are in Unix timestamp format
-- the _open values are 1 for open and 0 for closed
-- the id_registered_user values are the id of the EducationManager in charge of the recruitment session
INSERT INTO RecruitmentSession (name,start_date, end_date, _open, id_registered_user)
VALUES
    ('2023 Fall Recruitment', UNIX_TIMESTAMP('2022-06-01'), UNIX_TIMESTAMP('2022-09-30'), 1, 3),
    ('2023 Spring Recruitment', UNIX_TIMESTAMP('2023-01-01'), UNIX_TIMESTAMP('2023-04-30'), 1, 4);

-- Insert sample data into SchoolNote table
INSERT INTO SchoolNote (school_subject, note, id_registered_user)
VALUES
    ('Mathematics', 90.5, 5),
    ('Analysis', 85.0, 5),
    ('Development', 92.3, 6);

-- Insert sample data into JobExperience table
INSERT INTO JobExperience (company_name, job_position_name, job_description, start_date, end_date, id_registered_user)
VALUES
    ('ABC Company', 'Software Developer Intern', 'Developed web applications using HTML, CSS, and JavaScript', UNIX_TIMESTAMP('2021-07-01'), UNIX_TIMESTAMP('2022-01-31'), 5),
    ('XYZ Corporation', 'Marketing Assistant', 'Assisted in creating and implementing digital marketing campaigns', UNIX_TIMESTAMP('2020-08-01'), UNIX_TIMESTAMP('2022-06-30'), 6);

-- Insert sample data into Resume table
INSERT INTO Resume (url, id_registered_user)
VALUES
    ('http://example.com/resume1.pdf', 5),
    ('http://example.com/resume2.pdf', 6);

-- Insert sample data into TeacherInstructs table
INSERT INTO TeacherInstructs (id_registered_user, id_training_course)
VALUES
    (3, 1),
    (4, 2);

-- Insert sample data into CourseSubject table
INSERT INTO CourseSubject (id_school_subject, id_training_course)
VALUES
    (1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 2),
    (2, 4),
    (3, 2);

-- Insert sample data into CourseInSession table
INSERT INTO CourseInSession (id_training_course, id_recruitment_session)
VALUES
    (1, 1),
    (2, 1),
    (4, 1);
    (1, 2),
    (2, 2);
    (3, 2);