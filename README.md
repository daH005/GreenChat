A few words about this project
----------------------------
`GreenChat` is a messenger similar to Whatsapp, Telegram. This project contains:
1. Backend (on `Python`):
- Real-time messaging using `Websocket`
- RESTFul API on `Flask` + `Swagger` documentation
- `pytest`
- `smtp`
- `Redis` (to store expiring email-codes)
- `Celery` (to send email-codes)
- `Mysql` (main database) + `SQLAlchemy` + `Alembic`
- `Docker-compose`
- `Nginx`
- `Ngrok`

2. Frontend:
- `HTML`, `CSS`, `TS` -> `JS`
- `node.js` (for JS-tests and TS-compilation)
- `Selenium`

This project is being develoved with the goal of feeling how the real messengers are developed.

Demo
----
https://github.com/daH005/GreenChat/assets/60618372/665d1bde-2056-4c78-92fa-a9d5aaf42bf4

Docker-deployment steps:
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
REDIS_EMAIL_CODES_EXPIRES=60
MAX_ATTEMPTS_TO_CHECK_EMAIL_CODE=5
TEST_PASS_EMAIL_CODE=9999

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
2. Provide `mysql` with the version >= 8.0 and Database, User
3. Provide `redis` with the version >= 6.0
4. Provide `node.js` if you want to check frontend
5. Provide `python` virtual environment
6. Run `pip install -r requirements.txt` from the root directory
7. Make `./api/.env` file with the content exact as `./api.env` (but you have to set `DEBUG` as `True` for selenium-tests)
8. Make `./web/.env` file with the content exact as `./web.env`
9. Run `pytest ./api/_tests` (don't forgot about `PYTHONPATH` environment variable) for check backend
10. Run all processes of the project (don't forgot about `PYTHONPATH` environment variable):
- `python3 ./api/http_/main.py`
- `python3 ./api/http_/email/main.py`
- `python3 ./api/websocket_/main.py`
- `python3 ./web/main.py`
11. Check frontend:
- `node ./web/static/js/_tests/testAll.js`
- `pytest ./web/_tests` (you can run this only after 12'th step)
12. Go to [http://localhost:5182](http://localhost:5182)
