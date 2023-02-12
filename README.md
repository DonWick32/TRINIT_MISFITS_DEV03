# TRI-NIT-23

TRI NITT Hackathon 2023 - Team "MISFITS"

Video & APK Link : https://drive.google.com/drive/folders/1AxBWC427AhqvrkCl_g0k0RGbEnllsps_?usp=sharing

### API Setup:
- Clone repo and change directory to `backend`
- Create and activate virtualenv
```
python -m venv venv
. venv/bin/activate
```
- Install required packages
```
pip install -r requirements.txt
```
- Set required environment variables in `.env` file after renaming the `.env.example` file

- Start the API using the following command:
```
uvicorn main:app --reload
```

### Database Setup:
- Install PostgreSQL (currently tested on v15)
- Create a new database of your choice
- Update the .env file in backend with your credentials
- Don't forget to start the database service before using the API

### Frontend Setup(Web):
- Change directory to `Frontend-React`
- Install required packages
```
yarn install
```
- Run the development environment
```
yarn run dev
```

### Frontend Setup(App):
- Change directory to `Frontend-Flutter/all_things_green`
- Install required packages
```
flutter pub get
```
- Run the development environment
```
flutter run
```
Contributors:
- [Nitish N](https://github.com/DonWick32)
- [Selvanayagam S](https://github.com/S-Selvanayagam)
- [Sesha Raghavan](https://github.com/Sesha-2804)
