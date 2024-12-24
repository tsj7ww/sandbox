from sqlalchemy import create_engine
import psycopg2

class Database:
    """"""

    def __init__(self):
        self.CREDS = {
            'host': 'localhost',
            'port': 5432,
            'database': 'economic',
            'user': 'tjordan',
            'password': '',
        }

        url = 'postgresql://{user}:{password}@{host}:{port}/{database}'.format(**self.CREDS)
        self.engine = create_engine(url)
        self.conn = psycopg2.connect(url)
        self.cur = self.conn.cursor()

    def close(self):
        self.cur.close()
        self.conn.close()
        self.engine.dispose()