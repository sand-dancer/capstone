FROM amazoncorretto:8

COPY . /java

WORKDIR /java

EXPOSE 8080

ARG SOMEVAR 
RUN javac ${SOMEVAR}/BusinessProcess.java && cp ${SOMEVAR}/BusinessProcess.class /java

CMD ["java", "BusinessProcess"]

