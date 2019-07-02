#Version 0.0.4
#This version builds a spigot server
#using the recommended build strategy for spigot
#This is advantageous in that it’s better for plugin development
#and fits well with the Docker approach
#it also adds a first Minecraft plugin into the bare spigot server
#
FROM maven:3-jdk-8-slim as builder
COPY . /usr/src/maven/ 
WORKDIR /usr/src/maven
RUN mvn

FROM openjdk:8-jre-slim
MAINTAINER Steven Tobias “stobias123@gmail.com”

RUN mkdir /spigot && cd /spigot && apt-get update && apt-get install -y wget && \
    wget "https://cdn.getbukkit.org/spigot/spigot-1.14.3.jar" && \
    echo "eula=true" > eula.txt && \
    mkdir plugins

WORKDIR /spigot
COPY --from=builder /usr/src/maven/target/mineops-1.0-SNAPSHOT.jar /spigot/plugins/mineops.jar
COPY entrypoint.sh /spigot/

CMD java -Xms512m -Xmx1024m -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar /spigot/spigot-1.14.3.jar nogui

EXPOSE 25565
