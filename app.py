from flask import Flask, render_template, json, request
import os
import database.db_connector as db

# Configuration

app = Flask(__name__)
db_connection = db.connect_to_database()

# Routes

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/authors', methods=["GET", "POST"])
def authors():

    if request.method == "POST":
        insert_query = "INSERT INTO Authors (firstName, lastName) VALUES (%s, %s);"
        cursor = db.execute_query(
            db_connection=db_connection, 
            query=insert_query,
            query_params=(request.form["firstNameInput"], request.form["lastNameInput"]))

    select_query = "SELECT * FROM Authors"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    results = cursor.fetchall()

    return render_template("authors.html", authors=results)

@app.route('/bookauthors', methods=["GET", "POST"])
def bookauthors():

    if request.method == "POST":
        insert_query = "INSERT INTO BookAuthors (bookID, authorID) VALUES (%s, %s);"
        cursor = db.execute_query(
            db_connection=db_connection, 
            query=insert_query,
            query_params=(request.form["bookIdInput"], request.form["authorIdInput"]))

    select_query = "SELECT * FROM BookAuthors;"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    results = cursor.fetchall()

    select_query = "SELECT * FROM Books;"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    book_results = cursor.fetchall()

    select_query = "SELECT * FROM Authors;"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    author_results = cursor.fetchall()

    return render_template("bookauthors.html", bookauthors=results, books=book_results, authors=author_results)

@app.route('/books', methods=["GET", "POST"])
def books():

    if request.method == "POST":
        insert_query = "INSERT INTO Books (title, publisherName, amountOfTimesBorrowed, borrower) VALUES (%s, %s, %s, %s);"
        cursor = db.execute_query(
            db_connection=db_connection, 
            query=insert_query,
            query_params=(request.form["titleInput"], 
                request.form["publisherNameInput"],
                request.form["timesBorrowedInput"],
                request.form["memberIdInput"]))

    select_query = "SELECT * FROM Books;"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    results = cursor.fetchall()

    select_query = "SELECT * FROM Members;"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    member_results = cursor.fetchall()

    return render_template("books.html", books=results, members=member_results)

@app.route('/members', methods=["GET", "POST"])
def members():

    if request.method == "POST":
        insert_query = "INSERT INTO Members (firstName, lastName) VALUES (%s, %s);"
        cursor = db.execute_query(
            db_connection=db_connection, 
            query=insert_query,
            query_params=(request.form["firstNameInput"], request.form["lastNameInput"]))
    
    select_query = "SELECT * FROM Members"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    results = cursor.fetchall()

    return render_template("members.html", members=results)

@app.route('/ratings', methods=["GET", "POST"])
def ratings():

    if request.method == "POST":
        insert_query = "INSERT INTO Ratings (comment, starRating, bookID, memberID) VALUES (%s, %s, %s, %s);"
        cursor = db.execute_query(
            db_connection=db_connection, 
            query=insert_query,
            query_params=(request.form["commentInput"], 
                request.form["starInput"],
                request.form["bookIdInput"],
                request.form["memberIdInput"]))

    if request.args.get("bookIdInput"):
        select_query = "SELECT * FROM Ratings WHERE bookId = %s"
        cursor = db.execute_query(db_connection=db_connection, query=select_query, query_params=(request.args.get("bookIdInput"),))
    else:
        select_query = "SELECT * FROM Ratings"
        cursor = db.execute_query(db_connection=db_connection, query=select_query)
    results = cursor.fetchall()

    select_query = "SELECT * FROM Books;"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    book_results = cursor.fetchall()

    select_query = "SELECT * FROM Members;"
    cursor = db.execute_query(db_connection=db_connection, query=select_query)
    member_results = cursor.fetchall()

    return render_template("ratings.html", ratings=results, books=book_results, members=member_results)

# Listener

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(port=port, debug=True)