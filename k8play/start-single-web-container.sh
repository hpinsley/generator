echo Start a single container manually to see it it will respond on port 8080 on the host
echo
set -x
docker run -d --rm --name web -p 8080:80 my-registry:55000/hpinsley/generator:latest
sleep 1
docker ps | grep web
curl --location --head localhost:8080/swagger
docker stop web
docker ps | grep web
