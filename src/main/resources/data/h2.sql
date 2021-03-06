-- create table answer for testing
CREATE SCHEMA IF NOT EXISTS testdb;
DROP TABLE IF EXISTS ibiza_answer_option;

 -- create table ibiza_answer_option
CREATE TABLE ibiza_answer_option (answer_option_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, fk_question_id INT, answer_option TEXT);
-- insert testing data
INSERT INTO ibiza_answer_option (answer_option, fk_question_id) VALUES ('Kyllä', 1), ('Ei', 1), ('Ei koske minua', 1);

SELECT * FROM ibiza_answer_option;



--create table answers_chosen
DROP TABLE IF EXISTS answers_chosen;
CREATE TABLE answers_chosen (answer_id INT NOT NULL, answer_option_id INT NOT NULL);
--insert testing data
INSERT INTO answers_chosen (answer_id, answer_option_id) VALUES (1, 1), (1, 2);

SELECT * FROM answers_chosen;


-- create table ibiza_question_type
DROP TABLE IF EXISTS ibiza_question_type;
 
CREATE TABLE ibiza_question_type (question_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, type TEXT);
 
INSERT INTO ibiza_question_type (type) VALUES ('Monivalintakysymys'), ('Suosittelukysymys'), ('Avoin kysymys');

SELECT * FROM ibiza_question_type;




-- create table ibiza_user
DROP TABLE IF EXISTS ibiza_user;

CREATE TABLE ibiza_user (
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username text,
  password text,
  email text
);
INSERT INTO ibiza_user (username) VALUES ('user1'), ('user2'), ('user3');




-- create table ibiza_questionary

DROP TABLE IF EXISTS ibiza_questionary;
CREATE TABLE ibiza_questionary (
questionary_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
name TEXT NOT NULL, 
fk_user_id INT,
created_date timestamp DEFAULT CURRENT_TIMESTAMP(),
FOREIGN KEY (fk_user_id) REFERENCES ibiza_user (user_id),
);

INSERT INTO ibiza_questionary (name, fk_user_id) VALUES ('Kysely 1', 1), ('Kysely 2', 2), ('Kysely 3', 3);



-- create table ibiza_answer

DROP TABLE IF EXISTS ibiza_answer;
create table ibiza_answer (answer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_question_id INT,
    answer_str text,
    fk_answer_option_id INT,
    answered_date timestamp DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY (fk_question_id) REFERENCES ibiza_question (question_id),
    FOREIGN KEY (fk_answer_option_id) REFERENCES ibiza_answer_option (answer_option_id)
);

INSERT INTO ibiza_answer(fk_question_id, fk_answer_option_id) values (1,1), (1,2), (2,1), (2,2);

SELECT * FROM ibiza_answer;

-- create table ibiza_question 
DROP TABLE IF EXISTS ibiza_question;
CREATE TABLE ibiza_question (
  question_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  question TEXT NOT NULL,
  fk_question_type_id INT,
  fk_questionary_id INT,
  FOREIGN KEY (fk_question_type_id) REFERENCES ibiza_question_type (question_type_id),
  FOREIGN KEY (fk_questionary_id) REFERENCES ibiza_questionary (questionary_id)
);
 
INSERT INTO ibiza_question (question, fk_questionary_id, fk_question_type_id) VALUES ('Question 1', 1,1), ('Question 2', 1, 2), ('Question 3',1, 3);
INSERT INTO ibiza_question (question, fk_questionary_id, fk_question_type_id) VALUES ('Question 23',2, 2), ('Question 24', 2, 1), ('Question 25',2, 3);
INSERT INTO ibiza_question (question, fk_questionary_id, fk_question_type_id) VALUES ('Question 31', 3, 3), ('Question 32', 3, 2), ('Question 33',3, 1);


