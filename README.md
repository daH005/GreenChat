Few words about this project
----------------------------
`GreenChat` is the messenger on Python. Technologies used:
- Flask
- Websocket
- Mysql
- Redis
- Celery
- HTML, CSS, JS

Docker deployment steps:
------------------------

1. Clone (and all submodules)
2. Make `./api.env` file with the following content:
```env
DEBUG=False

HOST=0.0.0.0
WEBSOCKET_PORT=5180
HTTP_PORT=5181

CORS_ORIGINS=http://localhost:5182,http://127.0.0.1:5182,http://localhost:2222,http://127.0.0.1:2222

JWT_SECRET_KEY=<your_secret_key>
JWT_ALGORITHM=HS256
JWT_ACCESS_TOKEN_EXPIRES=604800

REDIS_HOST=redis
REDIS_PORT=6379

SMTP_HOST=smtp.mail.ru
SMTP_PORT=465

EMAIL=<your_email_for_codes_sending>
EMAIL_PASSWORD=<your_app_password>

DB_DRIVERNAME=mysql+mysqldb
DB_USERNAME=<your_username>
DB_PASSWORD=<your_password>
DB_HOST=db
DB_PORT=3306
DB_NAME=<your_database_name>
```
3. Make `./db.env` file with the following content:
```env
MYSQL_ROOT_PASSWORD=<your_password>
MYSQL_DATABASE=<your_database_name>
MYSQL_USER=<your_username>
MYSQL_PASSWORD=<your_password>
```
4. Make `./web.env` file with the following content:
```env
DEBUG=False
HOST=0.0.0.0
PORT=5182
```
5. Make `./webserver.env` file with the following content:
```env
WEBSITE_URL=http://web:5182
HTTP_API_URL=http://api_http:5181
WEBSOCKET_URL=http://api_websocket:5180
```
6. Start shell-scripts:
```sh
./shell/docker_/build_dockerfiles.sh
```
```sh
./shell/docker_/run.sh
```
Wait for successfully starting and go to [http://localhost:2222](http://localhost:2222)

For development:
----------------

1. Clone (and all submodules)
2. Provide the mysql with version >= 8.0 and Database, User
3. Provide the redis with version >= 6.0
4. Provide the node.js if you want to check frontend
5. Provide the virtual environment
6. Run `pip install -r requirements.txt` from root directory
7. Make `./api/.env` file with content exact as `./api.env` (but you have to set `DEBUG` as `True` for selenium-tests)
8. Make `./web/.env` file with content exact as `./web.env`
9. Run `pytest ./api/_tests` (don't forgot about `PYTHONPATH` environment variable) for check backend
10. For check frontend run:
- `node ./web/static/js/_tests/testAll.js`
- `pytest ./web/_tests`
11. Run all project procceses (don't forgot about `PYTHONPATH` environment variable):
- `python3 ./api/http_/main.py`
- `python3 ./api/http_/mail/main.py`
- `python3 ./api/websocket_/main.py`
- `python3 ./web/main.py`
12. Go to [http://localhost:5182](http://localhost:5182)
