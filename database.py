from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base

DATABASE_URL = "postgresql://a:ab@localhost/tri"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class Farmer(Base):
    __tablename__ = 'farmer'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    phone_number = Column(String, nullable=False)
    email = Column(String, nullable=False)
    region = Column(String, nullable=False)
    language = Column(String, nullable=False)
    password = Column(String, nullable=False)

class Enthusiast(Base):
    __tablename__ = 'enthusiast'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    phone_number = Column(String, nullable=False)
    email = Column(String, nullable=False)
    region = Column(String, nullable=False)
    language = Column(String, nullable=False)
    password = Column(String, nullable=False)

class Expert(Base):
    __tablename__ = 'expert'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    phone_number = Column(String, nullable=False)
    email = Column(String, nullable=False)
    region = Column(String, nullable=False)
    language = Column(String, nullable=False)
    password = Column(String, nullable=False)

Base.metadata.create_all(bind=engine)


def get_db():
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()

def get_farmers():
    farmers = []
    with get_db() as db:
        farmers = db.query(Farmer).all()
    return farmers

def get_enthusiasts():
    enthusiasts = []
    with get_db() as db:
        enthusiasts = db.query(Enthusiast).all()
    return enthusiasts

def get_experts():
    experts = []
    with get_db() as db:
        experts = db.query(Expert).all()
    return experts

def add_farmer(farmer: Farmer):
    with get_db() as db:
        db.add(farmer)
        db.commit()

def add_enthusiast(enthusiast: Enthusiast):
    with get_db() as db:
        db.add(enthusiast)
        db.commit()

def add_expert(expert: Expert):
    with get_db() as db:
        db.add(expert)
        db.commit()

