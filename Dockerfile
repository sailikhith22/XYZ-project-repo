FROM tomcat:9.0-jdk11-openjdk
COPY target/*XYZtechnologies-1.0.war /usr/local/tomcat/webapps/XYZtechnologies-1.0.war
EXPOSE 5000
CMD ["catalina.sh", "run"]
