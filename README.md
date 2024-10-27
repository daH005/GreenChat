A few words about this project
----------------------------
`GreenChat` is a messenger similar to Whatsapp on Python. This project contains:
1. Backend:
- REST API (Flask)
- Websocket (`websockets` library)
- Background email code sending (Celery)
- Database (MySQL)

2. Frontend:
- HTML, CSS, TS
- node.js
- Selenium

This project is being developed with the goal of feeling how the real messengers are developed.

Demo
----
https://github.com/daH005/GreenChat/assets/60618372/665d1bde-2056-4c78-92fa-a9d5aaf42bf4

Docker-deployment steps:
------------------------

1. Clone (and all submodules)
2. Make `./docker_compose/containers/api/.env` file with the following content:
```env
DEBUG=True

HOST=0.0.0.0
WEBSOCKET_PORT=5180
HTTP_PORT=5181

CORS_ORIGINS=http://localhost:5182,http://127.0.0.1:5182,http://localhost:2223,https://localhost:5182,https://127.0.0.1:5182,https://localhost:2223

JWT_SECRET_KEY=fill-it
JWT_ALGORITHM=HS256
JWT_ACCESS_TOKEN_EXPIRES=3600
JWT_REFRESH_TOKEN_EXPIRES=604800

REDIS_HOST=redis
REDIS_PORT=6379

SMTP_HOST=smtp.mail.ru
SMTP_PORT=465

EMAIL=greenchatapi_http_mail@mail.ru
EMAIL_PASSWORD=fill-it
EMAIL_CODES_EXPIRES=60
EMAIL_PASS_CODE=9999
EMAIL_CODES_MAX_ATTEMPTS=5

DB_DRIVERNAME=mysql+mysqldb
DB_USERNAME=GreenChatAdmin
DB_PASSWORD=fill-it
DB_HOST=db
DB_PORT=3306
DB_NAME=GreenChatDB
```
3. Make `./docker_compose/containers/db/.env` file with the following content:
```env
MYSQL_ROOT_PASSWORD=fill-it
MYSQL_DATABASE=GreenChatDB
MYSQL_USER=GreenChatAdmin
MYSQL_PASSWORD=fill-it
```
4. Make `./docker_compose/containers/web/.env` file with the following content:
```env
DEBUG=False
HOST=0.0.0.0
PORT=5182
```
5. Make `./docker_compose/containers/webserver/.env` file with the following content:
```env
WEBSITE_URL=http://web:5182
HTTP_API_URL=http://api:5181
WEBSOCKET_URL=http://api:5180
```
6. Provide `certificate.crt` and `private.key` files in `./api/ssl_` and `./web/ssl_` folders
7. Start shell-scripts:
```sh
./docker_compose/shell/run.sh
```
Wait for successfully starting and go to [https://localhost:2222](https://localhost:2222)
