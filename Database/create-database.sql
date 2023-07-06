-- Create the database
CREATE DATABASE IF NOT EXISTS WebCand;

-- Switch to the newly created database
USE WebCand;

CREATE TABLE Company(
   id_company INT,
   name VARCHAR(256) NOT NULL,
   business_sector VARCHAR(256) NOT NULL,
   size VARCHAR(256) NOT NULL,
   PRIMARY KEY(id_company),
   UNIQUE(name)
);

CREATE TABLE AdministrativeLevel(
   Id_EnumAdministrativeLevel COUNTER,
   role VARCHAR(256),
   PRIMARY KEY(Id_EnumAdministrativeLevel)
);

CREATE TABLE SchoolSubject(
   id_school_subject INT,
   title VARCHAR(256) NOT NULL,
   description TEXT,
   credit INT NOT NULL,
   PRIMARY KEY(id_school_subject)
);

CREATE TABLE TrainingCourse(
   id_training_course INT,
   title VARCHAR(256) NOT NULL,
   description TEXT,
   duration INT NOT NULL,
   PRIMARY KEY(id_training_course)
);

CREATE TABLE RegisteredUser(
   id_registered_user INT,
   email VARCHAR(256) NOT NULL,
   first_name VARCHAR(200) NOT NULL,
   last_name VARCHAR(200) NOT NULL,
   birth_date INT NOT NULL,
   password VARCHAR(256) NOT NULL,
   phone_number VARCHAR(256) NOT NULL,
   Id_EnumAdministrativeLevel INT NOT NULL,
   PRIMARY KEY(id_registered_user),
   UNIQUE(email),
   UNIQUE(phone_number),
   FOREIGN KEY(Id_EnumAdministrativeLevel) REFERENCES AdministrativeLevel(Id_EnumAdministrativeLevel)
);

CREATE TABLE CompanyRepresentative(
   id_registered_user INT,
   id_company INT NOT NULL,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user),
   FOREIGN KEY(id_company) REFERENCES Company(id_company)
);

CREATE TABLE ApplicationStatus(
   Id_ApplicationStatus COUNTER,
   status VARCHAR(256) NOT NULL,
   PRIMARY KEY(Id_ApplicationStatus),
   UNIQUE(status)
);

CREATE TABLE CompanyOffer(
   id_company_offer INT,
   duration INT NOT NULL,
   start_date INT NOT NULL,
   required_degree_level VARCHAR(256) NOT NULL,
   title VARCHAR(256) NOT NULL,
   description TEXT,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_company_offer),
   FOREIGN KEY(id_registered_user) REFERENCES CompanyRepresentative(id_registered_user)
);

CREATE TABLE Teacher(
   id_registered_user INT,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user)
);

CREATE TABLE Candidate(
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

CREATE TABLE AdmittedCandidate(
   id_registered_user INT,
   internal_email VARCHAR(256) NOT NULL,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE EducationManager(
   id_registered_user INT,
   PRIMARY KEY(id_registered_user),
   FOREIGN KEY(id_registered_user) REFERENCES RegisteredUser(id_registered_user)
);

CREATE TABLE RecruitmentSession(
   id_recruitement_session INT,
   name VARCHAR(256) NOT NULL,
   start_date INT NOT NULL,
   end_date INT NOT NULL,
   _open LOGICAL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_recruitement_session),
   FOREIGN KEY(id_registered_user) REFERENCES EducationManager(id_registered_user)
);

CREATE TABLE SchoolGrade(
   id_school_note INT,
   school_subject VARCHAR(256) NOT NULL,
   grade DOUBLE NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_school_note),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE JobExperience(
   id_job_experience INT,
   company_name VARCHAR(256),
   job_position_name VARCHAR(256) NOT NULL,
   job_description TEXT NOT NULL,
   start_date INT NOT NULL,
   end_date INT NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_job_experience),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE Resume(
   id_resume INT,
   url VARCHAR(256) NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_resume),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE Application(
   id_application INT,
   application_date DATE NOT NULL,
   Id_ApplicationStatus INT NOT NULL,
   id_recruitement_session INT NOT NULL,
   id_registered_user INT NOT NULL,
   PRIMARY KEY(id_application),
   FOREIGN KEY(Id_ApplicationStatus) REFERENCES ApplicationStatus(Id_ApplicationStatus),
   FOREIGN KEY(id_recruitement_session) REFERENCES RecruitmentSession(id_recruitement_session),
   FOREIGN KEY(id_registered_user) REFERENCES Candidate(id_registered_user)
);

CREATE TABLE Video(
   id_video INT,
   url VARCHAR(256) NOT NULL,
   id_application INT NOT NULL,
   PRIMARY KEY(id_video),
   FOREIGN KEY(id_application) REFERENCES Application(id_application)
);

CREATE TABLE CoverLetter(
   id_cover_letter INT,
   url VARCHAR(256) NOT NULL,
   id_application INT NOT NULL,
   PRIMARY KEY(id_cover_letter),
   FOREIGN KEY(id_application) REFERENCES Application(id_application)
);

CREATE TABLE Rating(
   Id_Notation COUNTER,
   grade DOUBLE,
   description VARCHAR(256),
   id_application INT NOT NULL,
   PRIMARY KEY(Id_Notation),
   FOREIGN KEY(id_application) REFERENCES Application(id_application)
);

CREATE TABLE TeacherInstructs(
   id_registered_user INT,
   id_training_course INT,
   PRIMARY KEY(id_registered_user, id_training_course),
   FOREIGN KEY(id_registered_user) REFERENCES Teacher(id_registered_user),
   FOREIGN KEY(id_training_course) REFERENCES TrainingCourse(id_training_course)
);

CREATE TABLE CourseSubject(
   id_school_subject INT,
   id_training_course INT,
   PRIMARY KEY(id_school_subject, id_training_course),
   FOREIGN KEY(id_school_subject) REFERENCES SchoolSubject(id_school_subject),
   FOREIGN KEY(id_training_course) REFERENCES TrainingCourse(id_training_course)
);
