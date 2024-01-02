
# End-to-End Create Relational Database and SQL Analysis for a E-Library 📖

A local library with multiple branches is venturing into digital apps to facilitate readers in borrowing and checking the availability of books. The design of the relational database can store and retrieve data such as the list of books availability and it's information details, borrow transaction, user information, and add wish to hold a book transaction.

## 🧐 Project Requirements

- Manages multiple libraries: 
    - The application manages multiple libraries, each housing a diverse collection of books with varying quantities available for borrowing.
- Book Collection:
    - The database needs to store information about the diverse collection of books, including titles, authors, and available quantities.
    - To make searching easier for users, books are also divided into categories such as: self-improvement, biography, Fantasy, Romance, Science Fiction, etc.
- User Registration:
    - Users can register on the e-library platform. Registered users can interact with the platform by borrowing books, placing holds, and managing their account.
- Loan and Hold System:
    - Users can borrow books from any library in this application if the book is available. 
    - The loan period is 2 weeks. Users can return books earlier than the due date
    - Books will be automatically returned when they exceed the due date
    - Users can only borrow 2 books at a time
    - The platform keeps track of loan transactions, including loan dates, due dates, and return dates.
    - Users can place holds on books that are currently unavailable.
    - The library maintains a hold queue, and when a book becomes available, it can be borrowed by the customer at the front of the queue. Additionally, if a customer doesn't borrow a held book within one week, the book is released for other users to borrow. 
    - Users can only hold 2 books at the same time



## 🎯 Mission Statements

    🏛️ Each Library can manage books availability
    📝 Each Library manage holder for the borrower
    📚 User can borrow and add wish to hold the book
    ⭐️ (Opt) User can add star review of the book


## 📝 Table Structures
| Table Name    | Description                                              |
|---------------|----------------------------------------------------------|
| authors       | Stores information about the book author                 |
| genres        | Stores information for the book genre                    |
| books         | Stores detailed information about the book               |
| users         | Stores user personal information                         |
| publishers    | Stores information about the publisher name              |
| book_authors  | Store information for book id with the author            |
| book_genres   | Store information for book id with the genres            |
| libraries     | Stores information for the library                       |
| library_books | Store information for book id with the library           |
| borrows       | Stores detailed information about the borrow transaction |
| hold          | Stores detailed information about the holder transaction |
| reviews       | Stores information about review of the book              |

#### Authors Table
The `authors` table will store information the book author, such as id and the name of it's author, an unique constraint will be added to the name.

```sql
CREATE TABLE authors(
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT u_author_name UNIQUE (name)
);
```

#### Genres Table
The `genres` table will store information about the book genre, such as id and genre name. An unique constraint will be added to the genre field.

```sql
CREATE TABLE genres(
    genre_id SERIAL PRIMARY KEY,
    genre VARCHAR(50) NOT NULL,
    CONSTRAINT u_genre UNIQUE (genre)
);
```

#### Books Table
The `books` table will store information about the book it self, including book_id, title, ISBN, synopsis, publisher_id and year of the book printed. A foreign key constraint will be added to the publisher_id field, relating to the `publisher` table and an unique constraint to ISBN.

```sql
CREATE TABLE books(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(225) NOT NULL,
    ISBN VARCHAR(100),
    synopsis TEXT,
    publisher_id INT,
    year SMALLINT,
    CONSTRAINT u_isbn UNIQUE (ISBN),
    CONSTRAINT fk_publisherid FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id) ON DELETE NO ACTION
);
```

#### Users Table
The `users` table will store information about personal users, such as id, user name, phone number, city id, and zip code. A unique constraint will be added to the phone number and email field.

```sql
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    CONSTRAINT u_users UNIQUE (email, phone_number)
);
```

#### Publishers Table
The `publishers` table will store information about the publisher company. It will include fields such as ad id and name. A unique constraint will be added to the name.

```sql
CREATE TABLE publishers(
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(225) NOT NULL,
    CONSTRAINT u_publishers_name UNIQUE (name)
);
```

#### Book Authors Table
The `book_authors` table will be added as a supporting normalization table that will store information about author_id and book_id key.

```sql
CREATE TABLE book_authors(
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE NO ACTION,
    CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE NO ACTION
);
```

#### Book Genres Table
The `book_genres` table will be added as a supporting normalization table that will store information about genre_id and book_id key.

```sql
CREATE TABLE book_genres(
    genre_id INT NOT NULL,
    book_id INT NOT NULL,
    CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE NO ACTION,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE NO ACTION
);
```

#### Libraries Table
The `libraries` table store information for existing library locations, including lib_id and name for the place. A unique constraint will be added to the name.

```sql
CREATE TABLE libraries(
    lib_id SERIAL PRIMARY KEY,
    name VARCHAR(225) NOT NULL,
    CONSTRAINT u_libraries_name UNIQUE (name)
);
```

#### Library Books Table
The `library_books` table will be added as a supporting normalization table that will store information about library_id, book_id and book_quantity_availability. A CHECK constraint will be applied to the availability field to prevent negative values.

```sql
CREATE TABLE library_books(
    lib_book_id SERIAL PRIMARY KEY,
    lib_id INT NOT NULL,
    book_id INT NOT NULL,
    availability INT NOT NULL,
    CONSTRAINT c_availability CHECK (availability >= 0),
    CONSTRAINT fk_libid FOREIGN KEY (lib_id) REFERENCES libraries(lib_id) ON DELETE RESTRICT,
    CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE RESTRICT
);
```

#### Borrows Table
The `borrows` table store information about the borrow transaction, such as id, user_id, lib_book_id, taken_time, due_time, and return_time. A CHECK constraint will be applied to the due_time field to prevent due_time less than 14 days and CHECK constraint to return_time field to prevent time not greater than the taken_time.

```sql
CREATE TABLE borrows(
    borrow_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    lib_book_id INT NOT NULL,
    taken_time TIMESTAMP NOT NULL,
    due_time TIMESTAMP NOT NULL,
    return_time TIMESTAMP,
    CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE NO ACTION,
    CONSTRAINT fk_libbookid FOREIGN KEY (lib_book_id) REFERENCES library_books(lib_book_id) ON DELETE NO ACTION,
    CONSTRAINT check_due_time CHECK (due_time = taken_time + INTERVAL '14 days'),
    CONSTRAINT check_return_time CHECK (return_time IS NULL OR return_time >= taken_time)
);
```

#### Holds Table
The `holds` table store information for wish to hold the book by users, such as id, user_id, lib_book_id, hold_time and end_time if the user has been converted to borrow transaction. A unique constraint will be added to the name. A CHECK constraint will be applied to the end_time field to prevent end_time is not greater than the hold_time.

```sql
CREATE TABLE hold(
    hold_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    lib_book_id INT NOT NULL,
    hold_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP,
    CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE NO ACTION,
    CONSTRAINT fk_libbookid FOREIGN KEY (lib_book_id) REFERENCES library_books(lib_book_id) ON DELETE NO ACTION,
    CONSTRAINT check_end_time CHECK (end_time IS NULL OR end_time >= hold_time)
);
```

#### Reviews Table
The `reviews` table store information for user to write a star assesment for the book that just returned. This will include id, book_id, user_id and rating. A foreign key constraint will be added to the book_id field, relating to the `books` table and user_id relating to the `users` table.

```sql
CREATE TABLE reviews(
    review_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    rating SMALLINT NOT NULL,
    CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE NO ACTION,
    CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE NO ACTION
);
```

![ERD](https://github.com/dickyalsyah/e-library-system/blob/main/img/ERD.jpg)


## 🤖 Extract, Transform and Load Dummy Data to the Database

To generate dummy data, I used the ETL method, or Extract, Transform, and Load. Extract, transform, load (ETL) is a three-phase process where data is extracted, transformed (cleaned, sanitized, scrubbed), and loaded into an output data container. 

The data extracted came from my scraping of [goodreads.com](https://goodreads.com) using the Selenium framework and HTML Parser. After that, I transformed the raw data into several dummy logic according to the requirements of this project. I have prepared the Python scripts `book_scrape.py` and `dummy_generator.py`. Each one can be customized according to your needs for the required data size. And in the final stage, I loaded the data into the destination database also using `create_insert_db.py`. Before running the script, you must modify the information for your database in the `environment.yaml` file.

Or if you want to try it out (generate data then import data to the database), you can run it locally by following these steps:

Clone the project

```bash
  git clone https://github.com/dickyalsyah/e-library-system.git
```

Go to the project directory

```bash
  cd my-project
```

Using environment default

```bash
  conda env create -f environment.yml
```

Activate the environment

```bash
  conda activate env
```

Run main script

```bash
  python main.py
```


## 🧪 Test and Retrive Data 

### Transactional Query 🛍️

The book lending transaction, for instance, "The Subtle Art of Not Giving a F*ck," should be followed by a check for availability, which must decrease by one.
```sql
BEGIN;

INSERT INTO borrows(borrow_id, user_id, lib_book_id, taken_time, due_time)
VALUES (801, 10, 380, '2023-12-11', '2023-12-25');

UPDATE library_books
SET availability = availability - 1
WHERE lib_book_id = 380;

COMMIT;

-- Check the data that just added
SELECT *
FROM (
  	SELECT *
	FROM borrows
	ORDER BY borrow_id DESC
	LIMIT 5
) AS last_five_rows
ORDER BY borrow_id ASC;
```
<p align="center" width="100%">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Transactional_1.png">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Transactional_2.png">
</p>

### Analytical Query 📊

#### Case 1:
Find top 10 books based on borrow count.
```sql
SELECT
	b.title
	, a.name AS author
	, COUNT(*) AS borrow_count
FROM borrows
JOIN library_books lb USING(lib_book_id)
JOIN books b USING(book_id)
JOIN book_authors ba USING(book_id)
JOIN authors a USING(author_id)
GROUP BY b.title,a.name
ORDER BY borrow_count DESC
LIMIT 10;
```
<p align="center" width="100%">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Q_1.png"> 
</p>

#### Case 2:
Find the top average review score for each book.
```sql
SELECT 
	b.title
	, a.name AS author
	, ROUND(AVG(r.rating), 1) AS average_rating
	, COUNT(*) AS reviewers
FROM reviews r
JOIN books b USING(book_id)
JOIN book_authors ba USING(book_id)
JOIN authors a USING(author_id)
GROUP BY b.title, a.name
ORDER BY reviewers DESC
LIMIT 10;
```
<p align="center" width="100%">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Q_2.png"> 
</p>

#### Case 3:
Determine the percentage of books that belong to each genre within a library.
```sql
SELECT 
	l.name AS library
	, g.genre 
    , ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY l.name), 2) AS genre_percentage
FROM books b
JOIN library_books lb USING(book_id)
JOIN libraries l USING(lib_id)
JOIN book_genres bg USING(book_id)
JOIN genres g USING(genre_id)
GROUP BY l.name, g.genre;
```
<p align="center" width="100%">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Q_3.png"> 
</p>

#### Case 4:
Searching books based on title and author.
```sql
-- Create Index on Books Title for performance tuning issue
CREATE INDEX idx_book_title
ON books USING btree(title);

-- Create Index on Authors Name for performance tuning issue
CREATE INDEX idx_author
ON authors USING btree(name);

SELECT
	b.title
	, a.name AS author
	, l.name AS library
	, lb.availability
	, b.synopsis
FROM library_books lb
JOIN libraries l USING(lib_id)
JOIN books b USING(book_id)
JOIN book_authors ba USING(book_id)
JOIN authors a USING(author_id)
WHERE
    (b.title ILIKE '%Hobbit%' OR b.title ILIKE '%tolkien%')
    AND (a.name ILIKE '%Hobbit%' OR a.name ILIKE '%tolkien%')
```
<p align="center" width="100%">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Q_4.png"> 
</p>

#### Case 5:
View first hold queue and the second hold queue in each library
```sql
SELECT
	title
	, library
	, user_first_holder
	, user_first_holder_time
	, user_next_holder
	, user_next_holder_time
FROM (
	SELECT
		title
		, library
		, user_id AS user_first_holder
		, hold_time AS user_first_holder_time
		, LEAD(user_id) OVER(PARTITION BY title, library ORDER BY hold_time) AS user_next_holder
		, LEAD(hold_time) OVER(PARTITION BY title, library ORDER BY hold_time) AS user_next_holder_time
		, ROW_NUMBER() OVER(PARTITION BY title, library ORDER BY hold_time) AS rn
	FROM (
		SELECT
			b.title
			, l.name AS library
			, h.user_id
			, h.hold_time
		FROM hold h
		JOIN library_books lb USING(lib_book_id)
		JOIN books b USING(book_id)
		JOIN libraries l USING(lib_id)
		WHERE h.end_time is NULL
	) AS subquery1
) AS subquery2
WHERE rn = 1;
```
<p align="center" width="100%">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Q_5.png"> 
</p>

#### Case 6:
Total books borrowing from the 6 last month by library
```sql
SELECT 
	l.name AS library
   	, COALESCE(COUNT(CASE WHEN bw.taken_time >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '6 months' THEN bw.borrow_id END),0) AS m_6
	, COALESCE(COUNT(CASE WHEN bw.taken_time >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '5 months' THEN bw.borrow_id END),0) AS m_5
	, COALESCE(COUNT(CASE WHEN bw.taken_time >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '4 months' THEN bw.borrow_id END),0) AS m_4
	, COALESCE(COUNT(CASE WHEN bw.taken_time >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '3 months' THEN bw.borrow_id END),0) AS m_3
	, COALESCE(COUNT(CASE WHEN bw.taken_time >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '2 months' THEN bw.borrow_id END),0) AS m_2
	, COALESCE(COUNT(CASE WHEN bw.taken_time >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 months' THEN bw.borrow_id END),0) AS m_1
FROM borrows bw
JOIN library_books lb USING(lib_book_id)
JOIN libraries l USING(lib_id)
WHERE
    bw.taken_time >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '6 months'
GROUP BY library
ORDER BY library;
```
<p align="center" width="100%">
    <img src="https://github.com/dickyalsyah/e-library-system/blob/main/img/Q_6.png"> 
</p>

## References

[Designing a relationship database by Craig Dickson](https://towardsdatascience.com/designing-a-relational-database-and-creating-an-entity-relationship-diagram-89c1c19320b2)

[What is ETL (Extract, transform, load)?](https://en.wikipedia.org/wiki/Extract,_transform,_load)

[Designing Snowflake Schema](https://www.databricks.com/glossary/snowflake-schema#:~:text=A%20snowflake%20schema%20is%20a,data%20marts%2C%20and%20relational%20databases.)


## 🔗 Follow me
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://dickyalsyah.com/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/dickyalsyah)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/dickyalsyah)

