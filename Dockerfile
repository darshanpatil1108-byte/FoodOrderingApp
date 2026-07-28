FROM tomcat:10.1-jdk21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY FoodOrderingApp.war /usr/local/tomcat/webapps/FoodOrderingApp.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
