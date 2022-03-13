## Agro Dash

##### Dependencies
- Python 3.8.10
- PostgreSQL 12
- OSGeo4W (32-bit)
- GDAL 3.4.1

In order to launch project, open repository folder with terminal and type the code below:

```
python -m venv env
source env/Scripts/activate
pip install -r requirements.txt
pip install GDAL-3.4.1-cp38-cp38-win_amd64.whl
cd backend/
python manage.py runserver
```

In order to launch telegram bot, open repository folder with another terminal not killing previous one and type the code below:

```
cd tgbot/
python bot.py
```

## Additional files:
- export.sql (Dump of the database)
- contour.qgs (QGIS project for editing contours)