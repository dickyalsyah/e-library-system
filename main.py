from python_files.dummy_generator import *
from python_files.insert_to_db import InsertDummy
import pandas as pd

def main():
    # Definde a book file path
    books_file_path = 'dummy_datasets/books_scraped.csv'
    raw_books_df    = pd.read_csv(books_file_path)
    
    # Generate the dummy data
    authors         = generate_authors(df=raw_books_df)
    authors_df      = pd.DataFrame(authors)
    genres          = generate_genres(df=raw_books_df)
    genres_df       = pd.DataFrame(genres)
    publishers      = generate_publishers(df=raw_books_df)
    publishers_df   = pd.DataFrame(publishers)
    books           = generate_books(df=raw_books_df, publishers=publishers)
    books_df        = pd.DataFrame(books)
    libraries       = generate_libraries()
    libraries_df    = pd.DataFrame(libraries)
    users           = generate_users(num_records=100)
    users_df        = pd.DataFrame(users)
    
    book_authors_df = pd.DataFrame(generate_book_authors(books=books, authors=authors, df=raw_books_df))
    book_genres_df  = pd.DataFrame(generate_book_genres(books=books, genres=genres, df=raw_books_df))
    lib_books       = generate_lib_books(books=books, libraries=libraries, num_records=500)
    lib_books_df    = pd.DataFrame(lib_books)
    reviews_df      = pd.DataFrame(generate_reviews(users=users, books=books, num_records=500))
    borrows_df      = pd.DataFrame(generate_borrows(users=users, lib_books=lib_books, num_records=1000))
    hold_df         = pd.DataFrame(generate_hold(users=users, lib_books=lib_books, num_records=750))
    
    # Define the path to the data
    path = 'dummy_datasets'
    
    # Save the dummy data to CSV files
    authors_df.to_csv(f'{path}/authors.csv', index=False)
    genres_df.to_csv(f'{path}/genres.csv', index=False)
    publishers_df.to_csv(f'{path}/publishers.csv', index=False)
    books_df.to_csv(f'{path}/books.csv', index=False)
    libraries_df.to_csv(f'{path}/libraries.csv', index=False)
    users_df.to_csv(f'{path}/users.csv', index=False)
    book_authors_df.to_csv(f'{path}/book_authors.csv', index=False)
    book_genres_df.to_csv(f'{path}/book_genres.csv', index=False)
    lib_books_df.to_csv(f'{path}/library_books.csv', index=False)
    reviews_df.to_csv(f'{path}/reviews.csv', index=False)
    borrows_df.to_csv(f'{path}/borrows.csv', index=False)
    hold_df.to_csv(f'{path}/hold.csv', index=False)

    # Define tables to insert data into
    tables = {
        'authors'       : f'{path}/authors.csv',
        'genres'        : f'{path}/genres.csv',
        'publishers'    : f'{path}/publishers.csv',
        'books'         : f'{path}/books.csv',
        'libraries'     : f'{path}/libraries.csv',
        'users'         : f'{path}/users.csv',
        'book_authors'  : f'{path}/book_authors.csv',
        'book_genres'   : f'{path}/book_genres.csv',
        'library_books' : f'{path}/library_books.csv',
        'reviews'       : f'{path}/reviews.csv',
        'borrows'       : f'{path}/borrows.csv',
        'hold'          : f'{path}/hold.csv'
    }

    # Create an instance of the class and insert the data
    dummy = InsertDummy()
    dummy.insert_data_from_csv(tables=tables)

if __name__ == "__main__":
    main()