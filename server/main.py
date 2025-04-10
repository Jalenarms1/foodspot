from fastapi import FastAPI, Request, Response
from pydantic import BaseModel

class NewUser(BaseModel):
    name: str
    email: str
    phoneNumber: str = None

app = FastAPI()

@app.post("/api/new-user")
async def create_user(req: Request):
    try:

        print(await req.json())

        return {"success": True}
    except Exception as e:
        return Response(f"Error: {e}", status_code=500)
        

