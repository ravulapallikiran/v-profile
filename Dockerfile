FROM eclipse-temurin:17
WORKDIR /app
COPY . /app
RUN apt update -y
RUN apt install -y maven
RUN mvn clean package
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.118/bin/apache-tomcat-9.0.118.tar.gz /app
RUN mkdir tomcat
RUN tar -xvf apache-tomcat-9.0.118.tar.gz
RUN mv apache-tomcat-9.0.118 tomcat
RUN cp -r target/*.war tomcat/apache-tomcat-9.0.118/webapps/
CMD ["/app/tomcat/apache-tomcat-9.0.118/bin/catalina.sh", "run"]

