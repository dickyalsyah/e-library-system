-- Create authors table with UNIQUE constraint in name
CREATE TABLE authors(
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT u_author_name UNIQUE (name)
);

-- Create genres table with UNIQUE constraint in genre
CREATE TABLE genres(
    genre_id SERIAL PRIMARY KEY,
    genre VARCHAR(50) NOT NULL,
    CONSTRAINT u_genre UNIQUE (genre)
);

-- Create publishers table with UNIQUE constraint in publisher name
CREATE TABLE publishers(
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(225) NOT NULL,
    CONSTRAINT u_publishers_name UNIQUE (name)
);

-- Create libraries table with UNIQUE constraint in library name
CREATE TABLE libraries(
    lib_id SERIAL PRIMARY KEY,
    name VARCHAR(225) NOT NULL,
    CONSTRAINT u_libraries_name UNIQUE (name)
);

-- Create users table with UNIQUE constraint in (email, phone_number)
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    CONSTRAINT u_users UNIQUE (email, phone_number)
);

-- Create books table with UNIQUE constraint in ISBN and FK constraint in publisher_id ON DELETE NO ACTION
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

-- Create book_authors table with FK constraint in (book_id & author_id) ON DELETE NO ACTION 
CREATE TABLE book_authors(
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE NO ACTION,
    CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE NO ACTION
);

-- Create book_genres table with FK constraint in (book_id & genre_id) ON DELETE NO ACTION 
CREATE TABLE book_genres(
    genre_id INT NOT NULL,
    book_id INT NOT NULL,
    CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE NO ACTION,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE NO ACTION
);

-- Create library_books table with FK constraint in (lib_id & book_id) ON DELETE RESTRICT
CREATE TABLE library_books(
    lib_book_id SERIAL PRIMARY KEY,
    lib_id INT NOT NULL,
    book_id INT NOT NULL,
    CONSTRAINT fk_libid FOREIGN KEY (lib_id) REFERENCES libraries(lib_id) ON DELETE RESTRICT,
    CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE RESTRICT
);

-- Create reviews table with FK constraint in (book_id & user_id) ON DELETE NO ACTION
CREATE TABLE reviews(
    review_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    rating SMALLINT NOT NULL,
    CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE NO ACTION,
    CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE NO ACTION
);

-- Create borrows table with FK constraint in (user_id & lib_book_id) ON DELETE NO ACTION and CHECK constraint in (due_time & return_time)
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

-- Create hold table with FK constraint in (user_id & lib_book_id) ON DELETE NO ACTION and CHECK constraint in end_time
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

-- Create Index on Books Title for performance tuning issue
CREATE INDEX idx_book_title
ON books USING btree(title);