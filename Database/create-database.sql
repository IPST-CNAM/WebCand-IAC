DROP DATABASE IF EXISTS WebCand;

-- Create the database
CREATE DATABASE IF NOT EXISTS WebCand;

-- Switch to the newly created database
USE WebCand;

CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'user';
GRANT ALL PRIVILEGES ON WebCand.* TO 'user'@'%';
FLUSH PRIVILEGES;

-- Remarks:
-- Dates are stored as integers in the format of Linux timestamps

-- The role of the user?
CREATE TABLE IF NOT EXISTS AdministrativeLevel(
   Id_EnumAdministrativeLevel INT AUTO_INCREMENT,
   role VARCHAR(256),
   PRIMARY KEY(Id_EnumAdministrativeLevel)
);

-- The main User table
CREATE TABLE IF NOT EXISTS RegisteredUser(
   id_registered_user INT AUTO_INCREMENT,
   email VARCHAR(256) NOT NULL,
   first_name VARCHAR(200) NOT NULL,
   last_name VARCHAR(200) NOT NULL,
   birth_date INT NOT NULL,
   password VARCHAR(256) NOT NULL,
   phone_number VARCHAR(256) NOT NULL,
   Id_EnumAdministrativeLevel INT NOT NULL,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(Id_EnumAdministrativeLevel) REFERENCES AdministrativeLevel(Id_EnumAdministrativeLevel),
   UNIQUE(email),
   UNIQUE(phone_number)
);

CREATE TABLE IF NOT EXISTS Company(
   id_company INT AUTO_INCREMENT,
   name VARCHAR(256) NOT NULL,
   business_sector VARCHAR(256) NOT NULL,
   size VARCHAR(256) NOT NULL,
   PRIMARY KEY(id_company),
   UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS CompanyOffer(
   id_company_offer INT AUTO_INCREMENT,
   duration INT NOT NULL,
   start_date INT NOT NULL,
   required_degree_level VARCHAR(256) NOT NULL,
   title VARCHAR(256) NOT NULL,
   description TEXT,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_company_offer),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user)
);

CREATE TABLE IF NOT EXISTS SchoolSubject(
   id_school_subject INT AUTO_INCREMENT,
   title VARCHAR(256) NOT NULL,
   description TEXT,
   credit INT NOT NULL,
   PRIMARY KEY(id_school_subject)
);

CREATE TABLE IF NOT EXISTS TrainingCourse(
   id_training_course INT AUTO_INCREMENT,
   title VARCHAR(256) NOT NULL,
   description TEXT,
   duration INT NOT NULL,
   PRIMARY KEY(id_training_course)
);

CREATE TABLE IF NOT EXISTS ApplicationStatus(
   Id_ApplicationStatus INT AUTO_INCREMENT,
   status VARCHAR(256) NOT NULL,
   PRIMARY KEY(Id_ApplicationStatus)
);

CREATE TABLE IF NOT EXISTS Application(
   id_application INT AUTO_INCREMENT,
   application_date INT NOT NULL,
   status VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_application)
);

CREATE TABLE IF NOT EXISTS Video(
   id_video INT AUTO_INCREMENT,
   url VARCHAR(256) NOT NULL,
   id_application INT NOT NULL,
   PRIMARY KEY(id_video),
   FOREIGN KEY(id_application) REFERENCES Application(id_application)
);

CREATE TABLE IF NOT EXISTS CoverLetter(
   id_cover_letter INT AUTO_INCREMENT,
   url VARCHAR(256) NOT NULL,
   id_application INT NOT NULL,
   PRIMARY KEY(id_cover_letter),
   FOREIGN KEY(id_application) REFERENCES Application(id_application)
);

-- Note: The id_registered_user values are the id of the RegisteredUser
-- the id_company values are the id of the Company that the RegisteredUser works for
CREATE TABLE IF NOT EXISTS CompanyRepresentative(
   id_registered_user INT,
   id_company INT NOT NULL,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user),
   FOREIGN KEY(id_company) REFERENCES Company(id_company)
);

CREATE TABLE IF NOT EXISTS Teacher(
   id_registered_user INT,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user)
);

CREATE TABLE IF NOT EXISTS Candidate(
   id_registered_user INT,
   ine_number INT NOT NULL,
   last_degree VARCHAR(160),
   work_experiences VARCHAR(300),
   gender CHAR(1) NOT NULL,
   skills VARCHAR(300),
   PRIMARY KEY(id_registered_user),
   UNIQUE(ine_number),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user)
);

CREATE TABLE IF NOT EXISTS AdmittedCandidate(
   id_registered_user INT,
   internal_email VARCHAR(256) NOT NULL,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE IF NOT EXISTS Administrative(
   id_registered_user INT,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user)
);

CREATE TABLE IF NOT EXISTS EducationManager(
   id_registered_user INT,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user)
);

CREATE TABLE IF NOT EXISTS RecruitmentSession(
   id_recruitement_session INT AUTO_INCREMENT,
   name VARCHAR(256) NOT NULL,
   start_date INT NOT NULL,
   end_date INT NOT NULL,
   _open INT NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_recruitement_session),
   FOREIGN KEY(id_registered_user) REFERENCES EducationManager(id_registered_user)
);

CREATE TABLE IF NOT EXISTS SchoolNote(
   id_school_note INT AUTO_INCREMENT,
   school_subject VARCHAR(256) NOT NULL,
   note DECIMAL(15,2) NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_school_note),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE SchoolGrade(
   id_school_note INT AUTO_INCREMENT,
   school_subject VARCHAR(256) NOT NULL,
   grade DOUBLE NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_school_note),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE IF NOT EXISTS JobExperience(
   id_job_experience INT AUTO_INCREMENT,
   company_name VARCHAR(256),
   job_position_name VARCHAR(256) NOT NULL,
   job_description TEXT NOT NULL,
   start_date INT NOT NULL,
   end_date INT NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_job_experience),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE IF NOT EXISTS Resume(
   id_resume INT AUTO_INCREMENT,
   url VARCHAR(256) NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_resume),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE IF NOT EXISTS TeacherInstructs(
   id_registered_user INT,
   id_training_course INT,
   PRIMARY KEY(id_registered_user, id_training_course),
   FOREIGN KEY(id_registered_user) REFERENCES Teacher(id_registered_user),
   FOREIGN KEY(id_training_course) REFERENCES TrainingCourse(id_training_course)
);

CREATE TABLE IF NOT EXISTS CourseSubject(
   id_school_subject INT,
   id_training_course INT,
   PRIMARY KEY(id_school_subject, id_training_course),
   FOREIGN KEY(id_school_subject) REFERENCES SchoolSubject(id_school_subject),
   FOREIGN KEY(id_training_course) REFERENCES TrainingCourse(id_training_course)
);

CREATE TABLE IF NOT EXISTS Apply(
   id_registered_user INT,
   id_application INT,
   PRIMARY KEY(id_registered_user, id_application),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user),
   FOREIGN KEY(id_application) REFERENCES Application(id_application)
);

CREATE TABLE IF NOT EXISTS CourseInSession(
   id_recruitement_session INT,
   id_training_course INT,
   PRIMARY KEY(id_recruitement_session, id_training_course),
   FOREIGN KEY(id_recruitement_session) REFERENCES RecruitmentSession(id_recruitement_session),
   FOREIGN KEY(id_training_course) REFERENCES TrainingCourse(id_training_course)
);
