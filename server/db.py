import sqlite3
from pydantic import BaseModel
from uuid import uuid4


def get_conn():
    return sqlite3.connect("local.db", check_same_thread=False)


def init_table(path):
    conn = get_conn()

    cursor = conn.cursor()

    with open(path, "r") as file:
        queries = file.read()
        print(queries)
        resp = cursor.execute(queries)


        file.close()
        cursor.close()
        conn.close()


def init_tables():
    init_table("./queries/user.sql")
    init_table("./queries/user_verification.sql")



