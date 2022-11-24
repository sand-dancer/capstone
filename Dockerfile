FROM amazoncorretto:8

COPY . /java

WORKDIR /java

RUN javac BusinessProcess.java

CMD java BusinessProcess $buildNum
