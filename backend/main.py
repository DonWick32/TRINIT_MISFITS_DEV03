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
from fastapi import File, UploadFile, Form, APIRouter
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import Response, JSONResponse
from fastapi import FastAPI, Header, Depends, HTTPException,Query
from fastapi.security import HTTPBasic, HTTPBasicCredentials
import hashlib
import uuid
import psycopg2

import difflib
import jwt
import datetime
from sqlalchemy.orm import Session
from database import (
    Farmer,
    Enthusiast,
    Expert,
    Query1,
    SessionLocal,
    UserIn,
    UserOut,
    get_db,
    get_query,
    get_users,
    add_user,
    update_user,
    delete_user,
)

app = FastAPI()

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

@app.get("/queries")
def read_queries():
    return get_query()

# Create a new user

def validate_signup_data(name: str, phone_number: str, email: str, password: str, language: str, state: str):
    if not name or not phone_number or not email or not password or not language or not state:
        raise HTTPException(status_code=400, detail="All fields are required")
    if len(password) < 8:
        raise HTTPException(status_code=400, detail="Password must be at least 8 characters long")

def hash_password(password: str):
    return hashlib.sha256(password.encode()).hexdigest()

@app.post("/users/{model_name}")
def create_user(model_name: str, user: UserIn):
    validate_signup_data(user.name, user.phone_number, user.email, user.password, user.language, user.region)

    if model_name == 'farmer':
        model = Farmer
    elif model_name == 'enthusiast':
        model = Enthusiast
    elif model_name == 'expert':
        model = Expert
    else:
        return {"message": "Invalid model name"}

    hashed_password = hash_password(user.password)
    user_data = user.dict()
    user_data['password'] = hashed_password

    try:
        with get_db() as db:
            db_user = model(**user_data)
            db.add(db_user)
            db.commit()
            user_id = db_user.id
        return {"message": "User created successfully", "user_id": user_id}
    except Exception as e:
        return {"message": str(e)}


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

SECRET_KEY = "secret_key"
ALGORITHM = "HS256"

class User(BaseModel):
    username: str
    password: str

def authenticate_user(credentials: HTTPBasicCredentials = Depends(HTTPBasic())):
    try:
        user = User.get(credentials.username)
        if user is None:
            raise HTTPException(status_code=400, detail="Incorrect username or password")
        if credentials.password != user.password:
            raise HTTPException(status_code=400, detail="Incorrect username or password")

        payload = {"sub": user.username, "iat": datetime.utcnow()}
        token = jwt.encode(payload, SECRET_KEY, algorithm=ALGORITHM).decode("utf-8")
        return {"access_token": token, "token_type": "bearer"}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error in authentication")

@app.post("/login")
async def login(credentials: HTTPBasicCredentials = Depends(HTTPBasic())):
    return authenticate_user(credentials)

    

# implement dataset integration and district data retrieval

current_directory = os.getcwd()
file_path = os.path.abspath(os.path.join(current_directory, os.pardir, "Dataset", "updated_list.json"))

with open(file_path, "r") as f:
    data = json.load(f)

@app.get("/district")
async def get_district_data(district: str = Query(..., description="The district name")):
    district_data = data.get(district.upper())
    if district_data is None:
        # If the district is not found, find the most similar district name
        closest_match = difflib.get_close_matches(district.upper(), data.keys(), n=1, cutoff=0.5)
        if closest_match:
            district_data = data.get(closest_match[0])
            return district_data
        else:
            return {"error": "District not found"}
    return district_data

# implement scheme data retrieval

current_directory = os.getcwd()
file_path = os.path.abspath(os.path.join(current_directory, os.pardir, "Dataset", "schemes.json"))

@app.get("/schemes")
async def get_schemes():
    with open(file_path, "r") as file:
        schemes = json.load(file)
    return schemes

# implement modern techniques data retrieval
current_directory = os.getcwd()
file_path1 = os.path.abspath(os.path.join(current_directory, os.pardir, "Dataset", "modern_techniques.json"))

@app.get("/techniques")
async def get_techniques():
    with open(file_path1, "r") as file:
        techniques = json.load(file)
    return techniques

@app.post("/query/{model_name}")
def create_query(model_name: str, sender_id: int, query_string: str):
    if model_name == 'farmer':
        model = Farmer
    elif model_name == 'enthusiast':
        model = Enthusiast
    elif model_name == 'expert':
        model = Expert
    else:
        return {"message": "Invalid model name"}

    try:
        with get_db() as db:
            sender = db.query(model).filter(model.id == sender_id).first()
            if not sender:
                return {"message": "Sender not found"}
            query = Query1(sender_id=sender_id, query_string=query_string)
            db.add(query)
            db.commit()
            query_id = query.id
        return {"message": "Query created successfully", "query_id": query_id}
    except Exception as e:
        return {"message": str(e)}
