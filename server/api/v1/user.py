from fastapi import APIRouter, Response, Request
from models.user import User, get_user_by_email
from pydantic import BaseModel
import jwt
import os
import json
from auth.auth import get_jwt_token, create_user_verification, verify_code, verify_user
import db

router = APIRouter()

@router.get("/me")
def get_user(req: Request):
    print("req handler")
    print(req.state.__dict__)
    try:
        user = req.state.__getattr__("user")

        return user

    except:
        return Response("User not found", status_code=404)



class VerificationReq(BaseModel):
    code: int
    email: str

@router.post("/verify/{verification_id}")
async def verify_input_code(verification_id: str, verification_req: VerificationReq):
    try:
        is_valid = verify_code(verification_id, verification_req.code)

        if not is_valid:
            return Response("Error validating code", status_code=400)
        
        print("verify user")
        user = verify_user(verification_req.email)

        if not user:
            raise Exception(f"error retrieving user info: {verification_req.email}")
        
        token = get_jwt_token(user)
        
        return {"token": token}
    except Exception as e:
        print(e)
        return Response(f"Error: {e}", status_code=500)
    
class EmailReq(BaseModel):
    email: str

@router.post("/login")
async def login_user(email_req: EmailReq):
    conn = db.get_conn()
    try:

        user = get_user_by_email(email_req.email, conn)
        print(user)

        if user is None:
            return Response("please make sure an account with this email exists", status_code=404)

        verification_id = create_user_verification(user.id, user.email, conn)

        conn.commit()
        conn.close()
        return {"verification_id": verification_id}
    except Exception as e:
        print(e)
        conn.close()
        return Response(f"Error: {e}", status_code=500)
    

@router.post("/")
async def create_user(new_user: User):
    try:
        try:
            conn = db.get_conn()

            if not new_user.insert_user(conn):
                conn.close()
                return Response(f"please make sure an account with this email doesn't exist", status_code=400)


            token = get_jwt_token(new_user)
            print(token)

            verification_id = create_user_verification(new_user.id, new_user.email, conn)

            if verification_id is None:
                conn.rollback()
                conn.close()
                raise Exception("Error: error processing verification code")
            
            conn.commit()

            conn.close()

            return {"verificationId": verification_id, "token": token}
        except Exception as e:
            print(e)
            return Response(f"Error: {e}", status_code=400)


    except Exception as e:
        print(e)
        return Response(f"Error: {e}", status_code=500)