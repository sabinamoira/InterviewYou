-- -----------------------------------------------------
-- Schema interviewYou
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS interviewYou;

CREATE SCHEMA interviewYou DEFAULT CHARACTER SET utf8;
USE interviewYou;


-- -----------------------------------------------------
-- Table Roles
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS roles
(
ID INT NOT NULL AUTO_INCREMENT UNIQUE,
role varchar(255) NOT NULL UNIQUE,
 PRIMARY KEY (ID))
ENGINE=InnoDB
AUTO_INCREMENT = 1;
-- -----------------------------------------------------
-- Table Users
-- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS users
-- (
-- ID BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
-- email varchar(255) NOT NULL UNIQUE,
-- authorization varchar(255) NOT NULL,
-- firstName varchar(255),
-- lastName varchar(255),
-- password varchar(255) NOT NULL,
--  PRIMARY KEY (ID))
-- ENGINE=InnoDB
-- AUTO_INCREMENT = 1;
-- -----------------------------------------------------
-- Table Categories
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categories (
  ID BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
 category VARCHAR(50) NULL DEFAULT NULL UNIQUE,
  PRIMARY KEY (ID))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table Topics
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS topics
( ID BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
  category_ID BIGINT NOT NULL,
  topic VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY (ID),
   CONSTRAINT FOREIGN KEY (category_ID) REFERENCES categories(ID)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table Questions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS questions
( ID BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
  topic_ID BIGINT NOT NULL,
  question varchar(767) NOT NULL UNIQUE,
  answer TEXT NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT FOREIGN KEY (topic_ID) REFERENCES topics(ID)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Update roles
-- -----------------------------------------------------
INSERT INTO roles(role) VALUES('ROLE_USER');
INSERT INTO roles(role) VALUES('ROLE_MODERATOR');
INSERT INTO roles(role) VALUES('ROLE_ADMIN');
-- -----------------------------------------------------
-- Update Users
-- -----------------------------------------------------
-- INSERT INTO Users(EMAIL, AUTHORIZATION, FIRSTNAME, LASTNAME, PASSWORD) VALUES ('myemail.com','ADMIN','Moraa','Onwonga','password');

-- -----------------------------------------------------
-- Update Categories
-- -----------------------------------------------------
INSERT INTO CATEGORIES(CATEGORY) VALUES ('Core Java');

-- -----------------------------------------------------
-- Update Topics
-- -----------------------------------------------------
INSERT INTO TOPICS(TOPIC, CATEGORY_ID) VALUES ('OOP Concepts', 1);
INSERT INTO TOPICS(TOPIC, CATEGORY_ID) VALUES ('Basic Java Concepts', 1);
INSERT INTO TOPICS(TOPIC, CATEGORY_ID) VALUES ('Collection Frameworks', 1);

-- -----------------------------------------------------
-- Update Questions
-- -----------------------------------------------------
INSERT INTO QUESTIONS (TOPIC_ID, QUESTION, ANSWER) VALUES (1, 'What is the difference between abstract class and interface in Java?', 'There are various differences between abstract class and interface in Java, however, the most significant would be Java’s restriction on permitting a class to extend just one class but lets it implement multiple interfaces.
An abstract class is good to define default behaviour for a family of class, but the interface is good to outline which is then used to leverage Polymorphism.
');
INSERT INTO QUESTIONS (TOPIC_ID, QUESTION, ANSWER) VALUES (1, 'What is an abstract class? How is it different from an interface, and why would you use it?', 'An abstract class is a class which can have state, code, and implementation, but an interface is a contract which is totally abstract.
The abstract class and inheritance equally take precautions that most of the code is written with abstract and high-level classes, therefore it can influence Inheritance and Polymorphism.
');
INSERT INTO QUESTIONS (TOPIC_ID, QUESTION, ANSWER) VALUES (1,
 'What is Inheritance?', 
'In object-oriented programming, inheritance is the mechanism of basing an object or class upon another object or class, retaining similar implementation. Also defined as deriving new classes from existing ones such as super class or base class and then forming them into a hierarchy of classes.');
INSERT INTO QUESTIONS (TOPIC_ID, QUESTION, ANSWER) VALUES (1,
 'Explain overloading and overriding in Java.', 
'They both let you write two methods of different functionality but with the same name, but overloading accumulates time activity while overriding is runtime activity. You can overload a method in the same class, however, you can only override a method in child classes.');


INSERT INTO QUESTIONS (TOPIC_ID, QUESTION, ANSWER) VALUES (2, 'What is the difference between ‘a == b’ and ‘a.equals(b)’?', 'The ‘a = b’ does object reference matching if both a and b are an object and only return true if both are pointing to the same object in the heap space. However, a.equals(b) is used for logical mapping and it is likely from an object to supersede this method to provide logical equality.
For example, String class overrides this equals() method so that you can associate two Strings, which are not the same object but covers the same letters.
');

INSERT INTO QUESTIONS (TOPIC_ID, QUESTION, ANSWER) VALUES (3, 'What is the difference between List, Set, Map and Queue in Java?', 'Answer: List, Set, and Map are three significant interfaces of Java collection framework.
Set provides an unordered collection of unique objects i.e. set does not allow duplicates, while Map provides a data structure based on key-value pair and hashing.
The difference between List and Set interface in Java is that List allows duplicates while Set does not allow duplicates. All implementation of Set honour this agreement. Map holds two objects per entry e.g. key and value, and it may contain duplicate values but keys are always unique.
One more difference between List and Set is that List is an ordered collection, List’s contract maintains insertion order or element. Set is an unordered collection, therefore you get no assurance on which order element will be stored.
Nevertheless, some of the set implementation (e.g. LinkedHashSet) retains order.
A queue is also ordered, but you will only ever touch elements at one end. All elements get inserted at the ‘end’ and removed from the ‘beginning’ (or head) of the queue.
You are able to find out how many elements are in the queue, but you are not able to find out what, for example, the ‘third’ element is.
');

