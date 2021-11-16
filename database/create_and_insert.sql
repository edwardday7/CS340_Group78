CREATE TABLE Authors (
	authorID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    PRIMARY KEY (authorID)
);

CREATE TABLE Members (
	memberID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (memberID)
);

CREATE TABLE Books (
	bookID INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    publisherName VARCHAR(255) NOT NULL,
    amountOfTimesBorrowed INT NOT NULL,
    borrower INT,
    PRIMARY KEY (bookID),
    FOREIGN KEY (borrower)
		REFERENCES Members (memberID)
);

CREATE TABLE Ratings (
	ratingID INT AUTO_INCREMENT NOT NULL,
    comment VARCHAR(255),
    starRating INT NOT NULL CHECK (starRating BETWEEN 1 AND 5),
    bookID INT NOT NULL,
    memberID INT NOT NULL,
    PRIMARY KEY (ratingID),
    FOREIGN KEY (bookID)
		REFERENCES Books (bookID)
        ON DELETE CASCADE,
	FOREIGN KEY (memberID)
		REFERENCES Members (memberID)
);

CREATE TABLE BookAuthors (
    bookID INT NOT NULL,
    authorID INT NOT NULL,
    PRIMARY KEY (bookID, authorID),
    FOREIGN KEY (bookID)
		REFERENCES Books (bookID)
        ON DELETE CASCADE,
	FOREIGN KEY (authorID)
		REFERENCES Authors (authorID)
);

INSERT INTO Authors (firstName, lastName) VALUES ('Hajime','Isayama'); -- 2
INSERT INTO Authors (firstName, lastName) VALUES ('Douglas','Adams'); -- 24
INSERT INTO Authors (firstName, lastName) VALUES ('Ernest','Cline'); -- 41
INSERT INTO Authors (firstName, lastName) VALUES ('Edward','Snowden'); -- 94
INSERT INTO Authors (firstName, lastName) VALUES ('Pierce','Brown'); -- 29
INSERT INTO Authors (firstName, lastName) VALUES ('Billy','Connolly'); -- 30

INSERT INTO Members (firstName, lastName) VALUES ('Joe','Smith');
INSERT INTO Members (firstName, lastName) VALUES ('Sadie','Ellis');
INSERT INTO Members (firstName, lastName) VALUES ('Byron','Henderson');
INSERT INTO Members (firstName, lastName) VALUES ('Alexa','Fisher');
INSERT INTO Members (firstName, lastName) VALUES ('Noel','Meza');
INSERT INTO Members (firstName, lastName) VALUES ('Sophia','Singleton');
INSERT INTO Members (firstName, lastName) VALUES ('Davis','Stevenson');

INSERT INTO Books (title, publisherName, amountOfTimesBorrowed) VALUES ('Attack on Titan: Volume 13','Kodansha Comics',5);
INSERT INTO Books (title, publisherName, amountOfTimesBorrowed, borrower) VALUES ("The Hitchhiker's Guide to the Galaxy: 42nd Anniversary Edition",'Pan Macmillan',2,1);
INSERT INTO Books (title, publisherName, amountOfTimesBorrowed, borrower) VALUES ('Ready Player One','Broadway Books',15,2);
INSERT INTO Books (title, publisherName, amountOfTimesBorrowed) VALUES ('Permanent Record','Metropolitan Books',1);
INSERT INTO Books (title, publisherName, amountOfTimesBorrowed, borrower) VALUES ('Morning Star','Del Rey',10,3);
INSERT INTO Books (title, publisherName, amountOfTimesBorrowed, borrower) VALUES ('Tall Tales and Wee Stories: The Best of Billy Connolly','Hachette UK',5,4);

INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES ('This book was terrible. I do not recommend', 1, 1, 1);
INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES ('What an awful read. Avoid', 1, 1, 2);
INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES ('Great book and I highly recommend.', 5, 3, 3);
INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES ('Meh, not the best but not the worst.', 3, 6, 5);
INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES ('Could be better. Not the worst but certainly not good.', 2, 5, 6);
INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES ('Good book, recommend.', 4, 3, 2);

INSERT INTO BookAuthors (bookID, authorID) VALUES (1, 1);
INSERT INTO BookAuthors (bookID, authorID) VALUES (2, 2);
INSERT INTO BookAuthors (bookID, authorID) VALUES (3, 3);
INSERT INTO BookAuthors (bookID, authorID) VALUES (4, 4);
INSERT INTO BookAuthors (bookID, authorID) VALUES (5, 5);
INSERT INTO BookAuthors (bookID, authorID) VALUES (6, 6);