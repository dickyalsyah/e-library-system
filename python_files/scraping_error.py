import pandas as pd
from books_scraper import scrap_book_info

def check_error_list():
    
    df_book_list = pd.read_csv('goodreads_book_list.csv')
    df_book_info = pd.read_csv('books_scraped.csv')
    
    error_urls = df_book_list[~df_book_list['url'].isin(df_book_info['url'])]
    
    return error_urls, df_book_info

def scraping():
    link_list, df_book_info = check_error_list()
    size_error = len(link_list)

    while size_error > 0:
        for book in link_list.itertuples(index=False):
            if book.url in df_book_info['url'].values:
                print(f"Skipping duplicate URL: {book.url}")
                continue

            while True:
                try:
                    book_info = scrap_book_info(book.url)
                    book_info['url'] = book.url
                    df_book_info = pd.concat([df_book_info, pd.DataFrame([book_info])], ignore_index=True)
                    print(f"Book {book_info['title']} was successfully scraped and appended to the book data")
                    df_book_info.to_csv('books_scraped.csv', index=False)  # Export to CSV after each successful scraping
                    print("Remaining Books to Scrap:", size_error - 1)
                    break  # Break out of the while loop if scraping is successful

                except Exception as e:
                    print(f"Error occurred while scraping book: {str(e)}")
                    break  # Break out of the while loop if there's an error

        link_list = link_list[~link_list['url'].isin(df_book_info['url'])]
        size_error = len(link_list)

scraping()
