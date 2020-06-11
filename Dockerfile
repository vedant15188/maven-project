FROM tomcat:latest

ADD ./webapp/target/webapp.war /usr/local/tomcat/webapps