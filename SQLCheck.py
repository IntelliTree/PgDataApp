#This implemetation (Auto data validator) was scrapped and replaced.
#This code is dead. Would like to revive?

"""

#import sqlite3
#from sqlite3 import Error

#def create_connection(pgdataapp):
    # create a database connection to the SQLite database

    #:param db_file: database file
    #:return: Connection object or None

    #try:
        #conn = sqlite3.connect(pgdataapp)
        #return conn
    #except Error as e:
        #print(e)

    #return None


def validate_productionCode(conn):
    cur = conn.cursor()
    cur.execute('''SELECT production_code FROM complaint''')
    all_rows = cur.fetchall()
    for row in all_rows:


def main():
    database = "pgdataapp.sql"

    # create a database connection
    conn = create_connection(database)
    with conn:
        print("Validating production codes...")



if __name__ == '__main__':
    main()
    """