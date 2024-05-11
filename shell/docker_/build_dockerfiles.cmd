cd ../../
docker build -t greenchatweb -f Dockerfile_web .
docker build -t greenchatapi_http -f Dockerfile_api_http .
docker build -t greenchatapi_http_email -f Dockerfile_api_http_email .
docker build -t greenchatapi_websocket -f Dockerfile_api_websocket .
