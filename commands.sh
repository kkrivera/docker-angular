docker build -t kkrivera/docker-angular:latest .

docker push kkrivera/docker-angular:latest

docker run -d --name ng-prod --rm -p 80:80 kkrivera/docker-angular