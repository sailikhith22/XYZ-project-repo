FROM tomcat:10.1-jdk17-openjdk
COPY target/XYZtechnologies-1.0.war /usr/local/tomcat/webapps/app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
