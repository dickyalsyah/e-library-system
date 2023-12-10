import psycopg2
from pyaml_env import parse_config

# Establish a connection to the PostgreSQL database

config = parse_config('environment.yml')['database']
conn = psycopg2.connect(
    host=config['DATABASE_HOST'],
    database=config['DATABASE_NAME'],
    user=config['DATABASE_USERNAME'],
    password=config['DATABASE_PASSWORD'],
    port=config['DATABASE_PORT']
)

# Create a cursor object to interact with the database
cur = conn.cursor()

# Execute the SELECT query to retrieve the desired column from the table
cur.execute("SELECT tablename FROM pg_catalog.pg_tables WHERE schemaname='public'")

# Fetch all the rows returned by the query
rows = cur.fetchall()

# Iterate over the rows and print the values of the selected column
for row in rows:
    column_value = row[0]  # Assuming the column is the first one selected
    print(column_value)

# Close the cursor and the database connection
cur.close()
conn.close()