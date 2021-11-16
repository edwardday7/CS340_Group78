
-- Get all books to populate the Books table
SELECT * FROM Books;

-- Get all authors to populate the Authors table
SELECT * FROM Authors;

-- Get all associations between books and authors to populate the BookAuthors table
SELECT * FROM BookAuthors;

-- Get all members to populate the Members table
SELECT * FROM Members;

-- Get all ratings to populate the Ratings table
SELECT * FROM Ratings;

-- Add new author
INSERT INTO Authors (firstName, lastName) VALUES (:firstName, :lastName);

-- Add new member
INSERT INTO Members (firstName, lastName) VALUES (:firstName, :lastName);

-- Add new book
INSERT INTO Books (title, publisherName, amountOfTimesBorrowed, borrower) VALUES (:title, :publisherName, :amountOfTimesBorrowed, :borrower);

-- Add new rating
INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES (:comment, :starRating, :bookID, :memberID);

-- Associate a book with an author (Add new bookauthor)
INSERT INTO BookAuthors (bookID, authorID) VALUES (:bookID, :authorID);

-- Delete a book (Cascades and deletes from many to many bookauthors and ratings)
DELETE FROM Books WHERE bookID = :bookID;

-- Filter the ratings by book id
SELECT * FROM Ratings WHERE bookID = :bookID;

-- Update a rating
UPDATE Ratings SET comment = :comment, starRating = :starRating, bookID = :bookID, memberID = :memberID WHERE ratingID = :ratingID;



