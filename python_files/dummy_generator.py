from faker import Faker
import pandas as pd
import random
from datetime import datetime, timedelta
import ast

# Initialize faker with Indonesia identity
fake = Faker('id_ID')
    
df = pd.read_csv('/Users/dickyalsyah/Documents/Pacmann/SQL/Exercise/dummy_datasets/books_scraped.csv')

def generate_genres(df):
    
    df['genre_'] = df['genres'].apply(ast.literal_eval)
    genre = set()

    for row in df.itertuples(index=False):
        for gen in row.genre_:
            genre.add(gen)
    
    genres = [{'genre_id': idx + 1,'genre': val} for idx, val in enumerate(genre)]
    
    return genres

def generate_authors(df):
    
    author_unique = df['author'].unique()
    authors = [{'author_id': idx + 1, 'name': val} for idx, val in enumerate(author_unique)]
    
    return authors

def generate_publishers(df):
    
    publisher_unique = df['publisher'].unique()
    publishers = [{'publisher_id': idx + 1, 'name': val} for idx, val in enumerate(publisher_unique)]
    
    return publishers    

def generate_books(df, publishers):
    
    book_records = []

    for index, val in enumerate(df.itertuples(index=False), start=1):
        publisher = val.publisher
        
        # Find the publisher_id based on the matching publisher name
        publisher_id = None
        for pub in publishers:
            if pub['name'] == publisher:
                publisher_id = str(pub['publisher_id'])
                break
        
        # Clean isbn value
        isbn = pd.to_numeric(val.isbn, errors='coerce')
        if pd.isnull(isbn):
            isbn = ""
        
        # Handle NaN value in year
        year = val.year
        if pd.isnull(year):
            year = ""
            
        book_records.append({
            'book_id': index,
            'title': val.title,
            'ISBN' : str(isbn).split('.0')[0],
            'synopsis' : val.synopsis,
            'publisher_id': publisher_id,
            'year': str(year).split('.0')[0]
        })
        
    return book_records

def generate_book_authors(books, authors, df):
    
    book_author_records = []
    
    for val in df.itertuples(index=False):
        book_title = val.title
        book_id = None
        author_id = None
        
        # Find the book_id based on the matching book title
        for book in books:
            if book['title'] == book_title:
                book_id = book['book_id']
                break
        
        # Find the author_id based on the matching author name
        for auth in authors:
            if auth['name'] == val.author:
                author_id = auth['author_id']
                break
        
        if book_id and author_id:
            book_author_records.append({
                'book_id': book_id,
                'author_id': author_id
            })
        
    return book_author_records

def generate_book_genres(books, genres, df):
    
    book_genres_records = []
    
    df['genre_'] = df['genres'].apply(ast.literal_eval)
    
    for val in df.itertuples(index=False):
        book_title = val.title
        book_id = None
        
        # Find the book_id based on the matching book title
        for book in books:
            if book['title'] == book_title:
                book_id = book['book_id']
                break
        
        # Find the genre_ids based on the matching genre names
        genre_ids = []
        for genre in val.genre_:
            for gen in genres:
                if gen['genre'] == str(genre):
                    genre_ids.append(gen['genre_id'])
                    break
        
        if book_id and genre_ids:
            for genre_id in genre_ids:
                book_genres_records.append({
                    'genre_id': genre_id,
                    'book_id': book_id
                })
        
    return book_genres_records
    
def generate_libraries():
    
    libraries = ['Perpusnas', 'Jakarta TIM Library']
    
    return [{'lib_id': idx + 1,'library': val} for idx, val in enumerate(libraries)]

def generate_lib_books(books, libraries, num_records=500):
    
    lib_books_records = []
    generated_combinations = set()

    while len(lib_books_records) < num_records:
        random_lib_id = random.choice(range(1, len(libraries) + 1))
        random_book_id = random.choice(range(1, len(books) + 1))
        combination = (random_lib_id, random_book_id)
        
        if combination not in generated_combinations:
            generated_combinations.add(combination)
            availability = random.randint(0, 100)
            
            lib_books_records.append({
                'lib_book_id': len(lib_books_records) + 1,
                'lib_id': random_lib_id,
                'book_id': random_book_id,
                'availability': availability
            })
    
    return lib_books_records

def generate_users(num_records=100):
    
    # Initialize empty record list
    user_records = []
    
    # Generate data based on number records that we wanted
    for index in range(num_records):
        user = {
            'user_id': index + 1,
            'name': fake.name(),
            'email': fake.email(),
            'phone_number': fake.phone_number()
        }
        
        # Append every generated data to the record list
        user_records.append(user)
        
    return user_records

def generate_reviews(books, users, num_records=500):
    
    reviews_records = []
    generated_combinations = set()
    
    while len(reviews_records) < num_records:
        random_book_id = random.choice(range(1, len(books) + 1))
        random_user_id = random.choice(range(1, len(users) + 1))
        combination = (random_book_id, random_user_id)
        
        if combination not in generated_combinations:
            generated_combinations.add(combination)
            rating = random.randint(1, 5)
            
            reviews_records.append({
                'review_id': len(reviews_records) + 1,
                'book_id' : random_book_id,
                'user_id' : random_user_id,
                'rating' : rating
            })
    
    return reviews_records

def generate_borrows(users, lib_books, num_records=1000):
    
    borrows_records = []
    
    while len(borrows_records) < num_records:
        random_user_id = random.choice(range(1, len(users) + 1))
        random_lib_book_id = random.choice(range(1, len(lib_books) + 1))
        taken_time = fake.date_time_between(start_date=datetime(2022, 1, 1), end_date='now')
        due_time = taken_time + timedelta(days=14)        

        return_time = None
        random_return_type = random.randint(0, 2)
        
        if random_return_type == 1:  # 33% chance of generating a return_time larger than due_time
            return_time = fake.date_time_between(start_date=due_time, end_date='now')
        elif random_return_type == 2:  # 33% chance of generating a return_time less than due_time
            return_time = fake.date_time_between(start_date=taken_time, end_date=due_time)
        
        borrows_records.append({
            'borrow_id': len(borrows_records) + 1,
            'user_id': random_user_id,
            'lib_book_id': random_lib_book_id,
            'taken_time': taken_time,
            'due_time': due_time,
            'return_time': return_time
        })
    
    return borrows_records
        
def generate_hold(users, lib_books, num_records=750):
    
    hold_records = []
    
    while len(hold_records) < num_records:
        random_user_id = random.choice(range(1, len(users) + 1))
        random_lib_book_id = random.choice(range(1, len(lib_books) + 1))
        hold_time = fake.date_time_between(start_date=datetime(2022, 1, 1), end_date='now')
        
        end_time = None
        if random.random() < 0.8:  # 80% chance of generating a non-null end_time
            end_time = fake.date_time_between(start_date=hold_time, end_date='now')
        
        # Validate if user already has 2 lib_book_id and end_time is empty
        user_hold_count = sum(1 for record in hold_records if record['user_id'] == random_user_id and record.get('end_time') is None)
        
        if user_hold_count < 2:
            hold_records.append({
                'hold_id': len(hold_records) + 1,
                'user_id': random_user_id,
                'lib_book_id': random_lib_book_id,
                'hold_time': hold_time.strftime("%Y-%m-%d %H:%M:%S"),
                'end_time': end_time.strftime("%Y-%m-%d %H:%M:%S") if end_time else None
            })
    
    return hold_records