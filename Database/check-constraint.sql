-- Check constraint for RegisteredUser.birth_date
ALTER TABLE RegisteredUser
ADD CONSTRAINT chk_registereduser_birthdate
CHECK (birth_date >= UNIX_TIMESTAMP('1900-01-01') AND birth_date <= UNIX_TIMESTAMP('2023-12-31'));

-- Check constraint for CompanyOffer.duration
ALTER TABLE CompanyOffer
ADD CONSTRAINT chk_companyoffer_duration
CHECK (duration > 0);

-- Check constraint for CompanyOffer.dates
ALTER TABLE CompanyOffer
ADD CONSTRAINT chk_companyoffer_startdate
CHECK (
    start_date >= UNIX_TIMESTAMP('1900-01-01') 
    AND start_date <= UNIX_TIMESTAMP('2023-12-31')
    );

-- Check constraint for Application.application_date
ALTER TABLE Application
ADD CONSTRAINT chk_application_applicationdate
CHECK (application_date >= UNIX_TIMESTAMP('1900-01-01') AND application_date <= UNIX_TIMESTAMP('2023-12-31'));

-- Check constraint for SchoolSubject.credit
ALTER TABLE SchoolSubject
ADD CONSTRAINT chk_schoolsubject_credit
CHECK (credit > 0);

-- Check constraint for TrainingCourse.duration
ALTER TABLE TrainingCourse
ADD CONSTRAINT chk_trainingcourse_duration
CHECK (duration > 0);

-- Check constraint for SchoolNote.note
ALTER TABLE SchoolNote
ADD CONSTRAINT chk_schoolnote_note
CHECK (note >= 0 AND note <= 20);

-- Check constraint for JobExperience.dates
ALTER TABLE JobExperience
ADD CONSTRAINT chk_jobexperience_dates
CHECK (
    start_date >= UNIX_TIMESTAMP('1900-01-01') 
    AND start_date <= UNIX_TIMESTAMP('2023-12-31') 
    AND end_date >= UNIX_TIMESTAMP('1900-01-01') 
    AND end_date <= UNIX_TIMESTAMP('2023-12-31')
    AND start_date <= end_date
    );

-- Check constraint for RecruitmentSession.dates
ALTER TABLE RecruitmentSession
ADD CONSTRAINT chk_recruitmentsession_dates
CHECK (
    start_date >= UNIX_TIMESTAMP('1900-01-01') 
    AND start_date <= UNIX_TIMESTAMP('2023-12-31') 
    AND end_date >= UNIX_TIMESTAMP('1900-01-01') 
    AND end_date <= UNIX_TIMESTAMP('2023-12-31')
    AND start_date <= end_date
    );