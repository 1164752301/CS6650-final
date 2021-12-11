FROM bellsoft/liberica-openjdk-alpine-musl:11 AS server-build
ADD target/final-dbms-1.0-SNAPSHOT.jar final-dbms-1.0-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar","final-dbms-1.0-SNAPSHOT.jar"]
EXPOSE 30001