from uuid import uuid4
from pydantic import BaseModel
from sqlite3 import Connection
import db



class User(BaseModel):
    id: str = None
    name: str
    email: str
    phone_number: str = None
    is_verified: bool = False

    def __init_subclass__(self, **kwargs):
        return super().__init_subclass__(**kwargs)

    def model_post_init(self, context):
        self.id = uuid4().__str__()
        return super().model_post_init(context)
    
    def insert_user(self, conn):
        print(self)
        cursor = conn.cursor()

        try:
            query = f'''
        insert into User (id, name, email, phone_number) values(?, ?, ?, ?)
        '''
            
            resp = cursor.execute(query, (self.id, self.name, self.email, self.phone_number))

            print(resp.fetchall())

            # conn.commit()

            cursor.close()

            # conn.close()

            return True
        except Exception as e:
            print(e)
            cursor.close()

            # conn.close()

            return False
        

def get_user_by_email(email: str, conn: Connection) -> User | None:

    query = '''
select * from User where email = ?
'''

    cursor = conn.cursor()

    row = cursor.execute(query, (email,)).fetchone()

    if row is None:
        return None
    print(row)
    return User(id=row[0], name=row[1], email=row[2], phone_number=row[3], is_verified=row[4])



