CREATE DATABASE chat;

USE chat;

CREATE TABLE Messages (
  /* Describe your table here.*/
  M_id int NOT NULL,
  text varchar(1000) NOT NULL,
  created_at timestamp,
  PRIMARY KEY (M_id)
);

CREATE TABLE Users (
  U_id int NOT NULL,
  username varchar(100) NOT NULL,
  PRIMARY KEY (U_id)
);

CREATE TABLE Rooms (
  R_id int NOT NULL,
  name varchar(20) NOT NULL,
  PRIMARY KEY (R_id)
);

-- if you want to get rid of a referenced table below, first you need to get rid of this table, then drop the one above.  

CREATE TABLE MessagesRoomsBridge (
  MR_id int NOT NULL,
  message_id int NOT NULL,
  room_id int NOT NULL,
  user_id int NOT NULL,
  FOREIGN KEY(message_id) REFERENCES Messages(M_id),
  FOREIGN KEY(room_id) REFERENCES Rooms(R_id),
  FOREIGN KEY(user_id) REFERENCES Users(U_id),
  PRIMARY KEY(MR_id)
);

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/