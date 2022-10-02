docker run --rm --name tomcat -p 8080:8080 --network my-bridge-network -v "/Users/OneDrive/Desktop/first-maven/demo-servlet/target/demo-servlet-1.0-SNAPSHOT.war:/usr/local/tomcat/webapps/servlet.war" tomcat:9.0.53-jdk11


docker network create -d bridge my-bridge-network

docker build -t "servlet:latest" .
docker run --rm --name custom-tomcat -p 8080:8080 --network  my-bridge-network servlet:latest

docker run --network my-bridge-network --rm curlimages/curl:7.85.0 --request POST http://localhost:8080/servlet/counter
docker run --network my-bridge-network --rm curlimages/curl:7.85.0 http://custom-tomcat:8080/servlet/counter


docker build -t "servlet:latest" .
остановить контейнер
docker network rm my-bridge-network
docker network create -d bridge my-bridge-network
docker run --rm --name custom-tomcat -p 8080:8080 --network  my-bridge-network servlet:latest
docker run --network my-bridge-network --rm curlimages/curl:7.85.0 -X POST http://custom-tomcat:8080/servlet/counter
docker run --network my-bridge-network --rm curlimages/curl:7.85.0 http://custom-tomcat:8080/servlet/counter