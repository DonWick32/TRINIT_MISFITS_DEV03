import json
import os
import shutil
import base64
import asyncio
import uvicorn
import logging
import database
from typing import Optional
from pydantic import BaseModel
from fastapi import File, UploadFile, Form
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import Response, JSONResponse
from fastapi import FastAPI, Header, Depends, HTTPException,Query
from fastapi.security import HTTPBasic, HTTPBasicCredentials
import hashlib
from sqlalchemy.orm import Session
from database import (
    Farmer,
    Enthusiast,
    Expert,
    UserIn,
    UserOut,
    get_users,
    add_user,
    update_user,
    delete_user,
)


app = FastAPI()



class Item(BaseModel):
    name: str
    phone_number: str
    email_id : str
    password: str
    language: str
    state: str

security = HTTPBasic()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/users/{model_name}")
def read_users(model_name: str):
    if model_name == 'farmer':
        model = Farmer
    elif model_name == 'enthusiast':
        model = Enthusiast
    elif model_name == 'expert':
        model = Expert
    else:
        return {"message": "Invalid model name"}

    return get_users(model)

@app.post("/users/{model_name}")
def create_user(model_name: str, user: UserIn):
    if model_name == 'farmer':
        model = Farmer
    elif model_name == 'enthusiast':
        model = Enthusiast
    elif model_name == 'expert':
        model = Expert
    else:
        return {"message": "Invalid model name"}

    add_user(model, user)
    return {"message": "User created successfully"}

@app.put("/users/{model_name}/{user_id}")
def update_user_details(model_name: str, user_id: int, updates: UserIn):
    if model_name == 'farmer':
        model = Farmer
    elif model_name == 'enthusiast':
        model = Enthusiast
    elif model_name == 'expert':
        model = Expert
    else:
        return {"message": "Invalid model name"}

    update_user(model, user_id, updates)
    return {"message": "User updated successfully"}

@app.delete("/users/{model_name}/{user_id}")
def delete_a_user(model_name: str, user_id: int):
    if model_name == 'farmer':
        model = Farmer
    elif model_name == 'enthusiast':
        model = Enthusiast
    elif model_name == 'expert':
        model = Expert
    else:
        return {"message": "Invalid model name"}

    delete_user(model, user_id)
    return {"message": "User deleted successfully"}

# login

class User(BaseModel):
    username: str
    password: str

def authenticate_user(credentials: HTTPBasicCredentials = Depends(security)):
    user = User.get(credentials.username)
    if user is None:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    if credentials.password != user.password:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    return user

@app.post("/login")
async def login(user: User, authorization: str = Header(None)):
    if authorization is None:
        return {"message": "Please provide credentials"}
    credentials = HTTPBasicCredentials(user.username, user.password)
    user = authenticate_user(credentials)
    return {"message": "Welcome, {}!".format(user.username)}
    
# signup

def validate_signup_data(name: str, phone_number: str, email: str, password: str, language: str, state: str):
    if not name or not phone_number or not email or not password or not language or not state:
        raise HTTPException(status_code=400, detail="All fields are required")
    if len(password) < 8:
        raise HTTPException(status_code=400, detail="Password must be at least 8 characters long")

def hash_password(password: str):
    return hashlib.sha256(password.encode()).hexdigest()

@app.post("/signup")
async def signup(request: dict, db: Session = Depends(database.get_db)):
    name = request.get("name")
    phone_number = request.get("phone_number")
    email = request.get("email")
    password = request.get("password")
    language = request.get("language")
    state = request.get("state")

    validate_signup_data(name, phone_number, email, password, language, state)

    hashed_password = hash_password(password)

    user = User(name=name, phone_number=phone_number, email=email, password=hashed_password, language=language, state=state)
    db.add(user)
    db.commit()

    return {"message": "User registered successfully"}

# implement dataset integration and district data retrieval

current_directory = os.getcwd()
file_path = os.path.abspath(os.path.join(current_directory, os.pardir, "Dataset", "updated_list.json"))

with open(file_path, "r") as f:
    data = json.load(f)

@app.get("/district")
async def get_district_data(district: str = Query(..., description="The district name")):
    district_data = data.get(district.upper())
    if district_data is None:
        return {"error": "District not found"}
    return district_data
