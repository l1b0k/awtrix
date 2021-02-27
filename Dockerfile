FROM openjdk:16-alpine

ADD https://blueforcer.de/awtrix/stable/awtrix.jar /usr/local/bin/awtrix.jar
ENV AUTOUPDATE=false AWTRIX_BETA=false TZ=Asia/Shanghai
EXPOSE 7000 7001

WORKDIR /awtrix
ENTRYPOINT ["java","-jar","/usr/local/bin/awtrix.jar"]
