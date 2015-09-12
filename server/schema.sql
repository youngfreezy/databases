CREATE DATABASE chat;

USE chat;

CREATE TABLE Messages (
  M_id int NOT NULL AUTO_INCREMENT,
  messageText varchar(1000) NOT NULL,
  created_at timestamp,
  PRIMARY KEY (M_id)
);

CREATE TABLE Users (
  U_id int NOT NULL AUTO_INCREMENT,
  username varchar(100) NOT NULL,
  PRIMARY KEY (U_id),
  UNIQUE (username)
);

CREATE TABLE Rooms (
  R_id int NOT NULL AUTO_INCREMENT,
  name varchar(20) NOT NULL,
  PRIMARY KEY (R_id)
);

-- if you want to get rid of a referenced table below, first you need to get rid of this table, then drop the one above.  
CREATE TABLE MessagesRoomsBridge (
  -- we need a primary composite key here to ensure that the combo of messages/users/rooms doesn't repeat.  
  MR_id int NOT NULL AUTO_INCREMENT,
  message_id int NOT NULL,
  room_id int NOT NULL,
  user_id int NOT NULL,
  PRIMARY KEY(MR_id, message_id, room_id, user_id)
);

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/