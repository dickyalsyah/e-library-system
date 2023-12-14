from python_files.dummy_generator import *
from python_files.create_insert_db import CreateInsertQuery
import pandas as pd

def main():
    # Definde a book file path
    books_file_path = 'dummy_datasets/books_scraped.csv'
    raw_books_df    = pd.read_csv(books_file_path)
    
    # Generate the dummy data
    authors         = generate_authors(df=raw_books_df)
    genres          = generate_genres(df=raw_books_df)
    publishers      = generate_publishers(df=raw_books_df)
    books           = generate_books(df=raw_books_df, publishers=publishers)
    libraries       = generate_libraries(['Perpusnas', 'Jakarta TIM Library'])
    users           = generate_users(num_records=100)
    
    book_authors    = generate_book_authors(books=books, authors=authors, df=raw_books_df)
    book_genres     = generate_book_genres(books=books, genres=genres, df=raw_books_df)
    lib_books       = generate_lib_books(books=books, libraries=libraries, num_records=500)
    reviews         = generate_reviews(users=users, books=books, num_records=500)
    hold            = generate_hold(users=users, lib_books=lib_books, num_records=750)
    # borrows         = generate_borrows(users=users, lib_books=lib_books, num_records=800)
    
    # Define the path to the data
    folder_name = '../dummy_datasets'
    
    # Save the dummy data to CSV files
    save_to_csv(data=authors, folder_path=folder_name, filename='authors.csv')
    save_to_csv(data=genres, folder_path=folder_name, filename='genres.csv')
    save_to_csv(data=publishers, folder_path=folder_name, filename='publishers.csv')
    save_to_csv(data=books, folder_path=folder_name, filename='books.csv')
    save_to_csv(data=libraries, folder_path=folder_name, filename='libraries.csv')
    save_to_csv(data=users, folder_path=folder_name, filename='users.csv')
    save_to_csv(data=book_authors, folder_path=folder_name, filename='book_authors.csv')
    save_to_csv(data=book_genres, folder_path=folder_name, filename='book_genres.csv')
    save_to_csv(data=lib_books, folder_path=folder_name, filename='library_books.csv')
    save_to_csv(data=reviews, folder_path=folder_name, filename='reviews.csv')
    # save_to_csv(data=borrows, folder_path=folder_name, filename='borrows.csv')
    save_to_csv(data=hold, folder_path=folder_name, filename='hold.csv')

    # Define tables to insert data into
    tables = {
        'authors'       : f'{folder_name}/authors.csv',
        'genres'        : f'{folder_name}/genres.csv',
        'publishers'    : f'{folder_name}/publishers.csv',
        'books'         : f'{folder_name}/books.csv',
        'libraries'     : f'{folder_name}/libraries.csv',
        'users'         : f'{folder_name}/users.csv',
        'book_authors'  : f'{folder_name}/book_authors.csv',
        'book_genres'   : f'{folder_name}/book_genres.csv',
        'library_books' : f'{folder_name}/library_books.csv',
        'reviews'       : f'{folder_name}/reviews.csv',
        # 'borrows'       : f'{folder_name}/borrows.csv',
        'hold'          : f'{folder_name}/hold.csv'
    }

    # Create an instance of the class to creating the tables and insert the data
    query_dummy = CreateInsertQuery()
    query_dummy.create_tables(sql_file='query/table_creation.sql')
    query_dummy.insert_data_from_csv(tables=tables)

if __name__ == "__main__":
    main()