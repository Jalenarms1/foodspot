from fastapi import APIRouter
import api.v1.user as user

api_router = APIRouter()



api_router.include_router(user.router, prefix="/users", tags=["users"])