FROM tomcat:jdk14-openjdk-buster

WORKDIR /home/

COPY pom.xml ./maven-project/pom.xml
COPY README.md ./maven-project/README.md
COPY server/ ./maven-project/server/
COPY webapp/ ./maven-project/webapp/

RUN pwd && ls -la
RUN cd maven-project && ls -la

RUN apt-get update
RUN apt install software-properties-common apt-utils -y
RUN apt install maven -y
RUN cd maven-project && pwd && ls -la &&  mvn compile test package

RUN cp ./maven-project/webapp/target/webapp.war /usr/local/tomcat/webapps/


