import datetime
from xmlrpc.client import DateTime
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base
from pydantic import BaseModel
from contextlib import contextmanager

DATABASE_URL = "postgresql://a:ab@localhost/tri"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class UserBase(Base):
    __abstract__ = True
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    phone_number = Column(String, nullable=False)
    email = Column(String, nullable=False)
    region = Column(String, nullable=False)
    language = Column(String, nullable=False)
    password = Column(String, nullable=False)

class Farmer(UserBase):
    __tablename__ = 'farmer'

class Enthusiast(UserBase):
    __tablename__ = 'enthusiast'

class Expert(UserBase):
    __tablename__ = 'expert'

class Query1(Base):
    __tablename__ = "queries"

    id = Column(Integer, primary_key=True, index=True)
    sender_id = Column(Integer, index=True)
    query_string = Column(String, index=True)

Base.metadata.create_all(bind=engine)

class UserIn(BaseModel):
    name: str
    phone_number: str
    email: str
    region: str
    language: str
    password: str

class UserOut(UserIn):
    id: int

@contextmanager
def get_db():
    session = SessionLocal()
    try:
        yield session
    finally:
        session.close()

def get_users(model):
    with get_db() as db:
        users = db.query(model).all()
    return [UserOut(id=user.id, name=user.name, phone_number=user.phone_number, email=user.email, region=user.region, language=user.language, password=user.password) for user in users]

def get_query():
    with get_db() as db:
        query = db.query(Query1).all()
    return [Query1(id=query.id, sender_id=query.sender_id, query_string=query.query_string) for query in query]
    
def add_user(model, user: UserIn):
    with get_db() as db:
        db_user = model(**user.dict())
        db.add(db_user)
        db.commit()
        return db_user.id

def update_user(model, user_id, updates: UserIn):
    with get_db() as db:
        db_user = db.query(model).get(user_id)
        if db_user:
            for key, value in updates.dict().items():
                setattr(db_user, key, value)
            db.commit()
        else:
            raise Exception(f"User with id {user_id} not found.")

def delete_user(model, user_id):
    with get_db() as db:
        db_user = db.query(model).get(user_id)
        if db_user:
            db.delete(db_user)
            db.commit()
        else:
            raise Exception(f"User with id {user_id} not found.")