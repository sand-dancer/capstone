FROM amazoncorretto:8

COPY . /java

WORKDIR /java

EXPOSE 8080

RUN javac BusinessProcess.java

CMD java BusinessProcess $buildNum
