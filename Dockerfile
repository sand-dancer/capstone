FROM amazoncorretto:8

COPY . /java

somebug

WORKDIR /java

EXPOSE 80

ARG SOMEVAR 
RUN javac ${SOMEVAR}/BusinessProcess.java && cp ${SOMEVAR}/BusinessProcess.class /java

CMD ["java", "BusinessProcess"]

