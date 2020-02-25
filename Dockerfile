FROM openjdk:15-alpine
COPY . /usr/app/
WORKDIR /usr/app
EXPOSE 8080
#RUN usermod -aG root Java
#USER Java
ENTRYPOINT ["java", "-javaagent:contrast.jar", "-Dcontrast.config.path=contrast_security.yaml", "-jar", "HTTPserver.jar", "--server.port=8080", "--server.address=0.0.0.0"]
