-- Find top 10 books
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

-- Find average rating
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

-- Determine the percentage of books that belong to each genre within a library
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

-- Searching books based on title and author
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
    (b.title LIKE '%Hobbit%' OR b.title LIKE '%Tolkien%')
    AND (a.name LIKE '%Hobbit%' OR a.name LIKE '%Tolkien%')
	
-- Hold Queue in each library
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

-- Users with exceed due date borrow
SELECT
	u.user_id
	, u.name
	, b.title
	, bw.taken_time
	, bw.due_time
	, (CURRENT_DATE - bw.due_time::DATE) AS diff_days
FROM borrows bw
JOIN library_books lb USING(lib_book_id)
JOIN books b USING(book_id)
JOIN users u USING(user_id)
WHERE bw.return_time is NULL and bw.due_time < CURRENT_DATE
ORDER BY diff_days DESC;

-- Total books borrowing from the 6 last month by library
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

-- Transactional query
SELECT *
FROM library_books
WHERE lib_book_id = 379;

BEGIN;

INSERT INTO borrows(borrow_id, user_id, lib_book_id, taken_time, due_time)
VALUES (1001, 10, 379, '2023-12-11', '2023-12-25');

UPDATE library_books
SET availability = availability - 1
WHERE lib_book_id = 379;

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

SELECT *
FROM library_books
WHERE lib_book_id = 379;