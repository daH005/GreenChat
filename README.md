A few words about this project
----------------------------
`GreenChat` is a messenger similar to Whatsapp on Python. This project contains:

Backend:
   
![Backend](https://skillicons.dev/icons?i=python,flask,mysql,redis,docker)

Frontend:

![Frontend](https://skillicons.dev/icons?i=html,css,js,ts,nodejs,selenium,docker)

This project is being developed with the goal of feeling how the real messengers are developed.

Demo
----
![image](https://github.com/user-attachments/assets/b189ba02-54a5-41d0-aa53-0664c6e457bc)

Docker-deployment steps:
------------------------

1. Clone the repository (and all submodules):
```sh
git clone --recurse-submodules git@github.com:daH005/GreenChat.git .
```
or
```sh
git clone --recurse-submodules https://github.com/daH005/GreenChat.git .
```  
2. Make `./api/.env` file with the following content:
```env
DEBUG=True

HOST=0.0.0.0
WEBSOCKET_PORT=5180
HTTP_PORT=5181

SSL_CERTFILE=../ssl/certificate.crt
SSL_KEYFILE=../ssl/private.key

CORS_ORIGINS=https?://(localhost|127\.0\.0\.1):(5182|2223)

JWT_SECRET_KEY=fill-it
JWT_ALGORITHM=HS256
JWT_ACCESS_TOKEN_EXPIRES=3600
JWT_REFRESH_TOKEN_EXPIRES=604800

REDIS_HOST=localhost
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
DB_HOST=localhost
DB_PORT=3306
DB_NAME=GreenChatDB

DB_TEST_USERNAME=GreenChatAdmin
DB_TEST_PASSWORD=fill-it
DB_TEST_HOST=localhost
DB_TEST_PORT=3306
DB_TEST_NAME=GreenChatTestDB

USER_AVATAR_MAX_CONTENT_LENGTH=314572800
USER_BACKGROUND_MAX_CONTENT_LENGTH=10485760000
MESSAGE_FILES_MAX_CONTENT_LENGTH=524288000

DEFAULT_TRANSACTION_RETRY_MAX_ATTEMPTS=10
```
3. Make `./web/.env` file with the following content:
```env
DEBUG=False
HOST=0.0.0.0
PORT=5182

SSL_CERTFILE=../ssl/certificate.crt
SSL_KEYFILE=../ssl/private.key
```
4. Make `./docker_compose/containers/db/.env` file with the following content:
```env
MYSQL_ROOT_PASSWORD=fill-it
MYSQL_DATABASE=GreenChatDB
MYSQL_USER=GreenChatAdmin
MYSQL_PASSWORD=fill-it
```
5. Make `./docker_compose/containers/test_db/.env` file with the following content:
```env
MYSQL_ROOT_PASSWORD=fill-it
MYSQL_DATABASE=GreenChatTestDB
MYSQL_USER=GreenChatAdmin
MYSQL_PASSWORD=fill-it
```
6. Make `./docker_compose/containers/webserver/.env` file with the following content:
```env
WEBSITE_URL=https://web:5182
HTTP_API_URL=https://api:5181
WEBSOCKET_URL=https://api:5180
```
7. Provide `./ssl/certificate.crt` and `./ssl/private.key` with `./build_helpers/gen_ssh_files.sh`
8. Start shell-scripts:
```sh
./docker_compose/shell/run.sh
```
Wait for successfully starting and go to [https://localhost:2223](https://localhost:2223)

For development
---------------
Look at `build_helpers`. Project have to be on Linux.
