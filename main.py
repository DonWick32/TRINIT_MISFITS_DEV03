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
from fastapi import FastAPI, Header, Depends, HTTPException
from fastapi.security import HTTPBasic, HTTPBasicCredentials
import hashlib
from sqlalchemy.orm import Session


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

@app.get("/farmers")
async def get_farmers():
    return database.get_farmers()

@app.post("/signup/farmers")
async def add_farmer(farmer: Item):
    database.add_farmer(farmer)
    return {"message": "Farmer added"}

@app.get("/enthusiasts")
async def get_enthusiasts():
    return database.get_enthusiasts()

@app.post("/signup/enthusiasts")
async def add_enthusiast(enthusiast: Item):
    database.add_enthusiast(enthusiast)
    return {"message": "Enthusiast added"}

@app.get("/experts")
async def get_experts():
    return database.get_experts()

@app.post("/signup/experts")
async def add_expert(expert: Item):
    database.add_expert(expert)
    return {"message": "Expert added"}

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

    # Validate the provided data
    validate_signup_data(name, phone_number, email, password, language, state)

    # Hash the password before storing it in the database
    hashed_password = hash_password(password)

    # Save the user information to the database
    user = User(name=name, phone_number=phone_number, email=email, password=hashed_password, language=language, state=state)
    db.add(user)
    db.commit()

    # Return a success response
    return {"message": "User registered successfully"}
