import httpx
from selectolax.parser import HTMLParser
from chromedriver_py import binary_path
from selenium.webdriver.chrome.service import Service
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import pandas as pd

base_url = "https://www.goodreads.com"

headers = {
    'User-Agent' : 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'
}

def scrap_books_list(genre):
    
    category = f"{base_url}/shelf/show/{genre}"
    resp =  httpx.get(category, headers=headers)

    html = HTMLParser(resp.text)
    total_item_info = html.css_first(".mediumText").text()
    total_items = int(total_item_info.strip().split()[-1].replace(',', ''))

    items_per_page = 50
    total_pages = (total_items + items_per_page - 1) // items_per_page
    max_pages_to_scrape = 20

    urls = []

    for page in range(21, min(max_pages_to_scrape, total_pages) + 1):
        url = f"{category}?page={page}"
        resp =  httpx.get(url, headers=headers)
        
        books = HTMLParser(resp.text).css(".elementList")
        
        for book in books:
            node = book.css(".left")
            for n in node:
                urls.append(base_url + n.css_first("a.bookTitle").attributes['href'])
        
    print(f"Books of genre {genre} was scraped over {len(urls)}")
    return urls

def scrap_book_info(url):
    
    options = webdriver.ChromeOptions()
    driver = webdriver.Chrome(service=Service(executable_path=binary_path), options=options)
    driver.get(url)

    # book_data = []
    # Find the book title element and extract the text
    title = driver.find_element(By.CLASS_NAME, 'Text__title1').text
    author = driver.find_element(By.XPATH, '//*[@id="__next"]/div[2]/main/div[1]/div[2]/div[1]/div[2]/div[1]/h3/div/span[1]/a[1]/span').text
    genres_elements = driver.find_elements(By.CLASS_NAME, "BookPageMetadataSection__genreButton")
    genres = [label.find_element(By.CLASS_NAME, "Button__labelItem").text for label in genres_elements]
    synopsis = driver.find_element(By.CLASS_NAME, "Formatted").text.split('\n')[0]
    cover = driver.find_element(By.CLASS_NAME, "ResponsiveImage").get_attribute("src")

    time.sleep(2)
    
    book_detail_parent = driver.find_element(By.CLASS_NAME, "BookDetails")
    
    # Click the "Book details & editions" button
    button_container = book_detail_parent.find_element(By.CLASS_NAME, "Button__container")
    button_element = button_container.find_element(By.TAG_NAME, "button")
    button_element.click()

    time.sleep(2)
    
    # Find the parent element with class "EditionDetails"
    detail_element = driver.find_element(By.CLASS_NAME, "EditionDetails")

    dt_elements = detail_element.find_elements(By.TAG_NAME, "dt")
    # Get all the div elements
    dd_elements = detail_element.find_elements(By.TAG_NAME, "dd")

    # Create a dictionary by zipping dt_elements and dd_elements
    data_dict = dict(zip([dt.text for dt in dt_elements], [dd.text for dd in dd_elements]))

    # Extract book details values
    published = data_dict.get("Published", "").split("by")
    publisher = published[1].strip() if len(published) > 1 else "Ebook"
    year = published[0].split(', ')[1].strip() if len(published[0].split(', ')) > 1 else ""
    isbn = data_dict.get("ISBN", "").split(' ')[0].strip()

    # Close the browser
    driver.quit()
    
    book_data = {
        "title" : title,
        "author" : author,
        "genres" : genres,
        "synopsis" : synopsis,
        "publisher" : publisher,
        "year" : year,
        "isbn" : isbn,
        "cover" : cover
    }
    
    return book_data

def book_list(genres):
        
    books_list = set()  # Create an empty set to store unique book values

    for genre in genres:
        try:
            books = scrap_books_list(genre)  # Assuming scrap_books_list() returns a list of books for a given genre
            books_list.update(books)  # Add the books to the set
        except Exception as e:
            print(f"Error occurred while scraping books for genre: {genre}. Error: {str(e)}")
            continue

    print(len(books_list))
    list_of_books = pd.DataFrame(list(books_list), columns=['url'])

    list_of_books.to_csv('goodreads_book_list.csv', index=False)
    
    return book_list, list_of_books

def main_scrapper(genres):

    book_list, list_of_books = book_list(genres)
    book_data = []
    start_time = time.time()
    for book in book_list:
        try:
            book_info = scrap_book_info(book)
            book_info['url'] = book
            book_data.append(book_info)
            print(f"Book {book_info['title']} was successfully scraped")
        except Exception as e:
            print(f"Error occurred while scraping book: {str(e)}")
            continue
        
    print(time.time() - start_time)

    print(len(book_data))

    df_book_info = pd.DataFrame(book_data)

    df_book_info.to_csv('books_scraped.csv', index=False)
    
    error_list = list_of_books[~list_of_books['url'].isin(list_of_books['url'])]
    
    print(f"Books was succesfully scraped is {len(df_book_info)} and the failed scraped is {len(error_list)}")


genre_to_scraps = ['fantasy', 'biography', 'history', 'psychology', 'science-fiction', 'romance', 'religion']
main_scrapper(genre_to_scraps)

# _url = 'https://www.goodreads.com/book/show/40727118-the-sea-of-monsters'

# print(scrap_book_info(_url))