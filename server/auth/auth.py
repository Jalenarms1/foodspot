import jwt
from models.user import User
import os
import db
from datetime import datetime, timedelta
from uuid import uuid4
import random
import smtplib
from auth.utils import send_html_verification_email


def get_jwt_token(user: User):
    payload = {
        'user_id': user.id,
        'user_name': user.name,
        'user_email': user.email,
        'user_phone': user.phone_number if user.phone_number is not None else "",
        'user_is_verified': user.is_verified
    }
    secret_key = os.getenv("JWT_SECRET")
    algorithm = "HS256"

    token = jwt.encode(payload=payload, key=secret_key, algorithm=algorithm)
    print(token)

    return token

def get_user_from_token(token: str):
    s_key = os.getenv("JWT_SECRET")
    print(token)
    payload = jwt.decode(token, key=s_key, algorithms=["HS256"])

    if not isinstance(payload, dict) or token.strip() == "":
        return None
    
    print(payload)

    user = User(id=payload['user_id'], name=payload['user_name'], email=payload['user_email'], phoneNumber=payload['user_phone'], is_verified=payload['user_is_verified'])

    return user

def create_user_verification(user_id: str, user_email: str, conn) -> str | None:

    id = uuid4().__str__()
    expires_at = (datetime.now() + timedelta(minutes=15)).timestamp()
    code = random.randint(100000, 999999)

    query = '''
insert into UserVerification (id, userId, code, expires_at) values (?,?,?, ?)
'''
    cursor = conn.cursor()
    try:
        cursor.execute(query, (id, user_id, code, expires_at))

        # send email with verifcation code
        send_html_verification_email(to_email=user_email, code=code)

        # conn.commit()
    except Exception as e:
        print(e)
        return None

    cursor.close()
    # conn.close()

    return id

def verify_code(verification_id:str, code: int):
    conn = db.get_conn()

    curr_timestamp = datetime.now().timestamp()

    query = '''
select 1 from UserVerification where id = ? and code = ? and expires_at >= ?
'''
    print(code)
    cursor = conn.cursor()
    
    rec = cursor.execute(query, (verification_id, code, curr_timestamp)).fetchone()

    if rec:
        return True
    else:
        return False
    
def verify_user(email: str) -> User | None:
    conn = db.get_conn()

    query = '''
update user set is_verified = 1 where email = ?
'''

    cursor = conn.cursor()

    cursor.execute(query, (email,))

    conn.commit()

    query = '''
select id, name, email, phone_number, is_verified from User where email = ?
'''

    resp = cursor.execute(query, (email,)).fetchone()

    cursor.close()

    if not resp:
        return None

    user = User(id=resp[0], name=resp[1], email=resp[2], phone_number=resp[3], is_verified=resp[4])

    return user




