from fastapi import FastAPI, Request
import db
from api.v1.api_v1 import api_router
from dotenv import load_dotenv
import jwt
import os
from models.user import User
from auth.auth import get_user_from_token

load_dotenv()

db.init_tables()

app = FastAPI()

@app.middleware("http")
def userIdentifier(req: Request, call_next):

    print(req.headers)
    auth_header = req.headers.get("authorization", None)
    if auth_header is not None:
        print(auth_header)
        if len(auth_header.split(" ")) > 1:
            token = auth_header.split(" ")[1]
            print(token)

            user = get_user_from_token(token)

            req.state.user = user


    return call_next(req)

app.include_router(api_router, prefix="/api", tags=["api"])


        

