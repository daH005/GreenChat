cd ../../
sudo docker build -t greenchatweb -f Dockerfile_web .
sudo docker build -t greenchatapi_http -f Dockerfile_api_http .
sudo docker build -t greenchatapi_http_mail -f Dockerfile_api_http_mail .
sudo docker build -t greenchatapi_websocket -f Dockerfile_api_websocket .
