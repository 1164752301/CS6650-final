FROM bellsoft/liberica-openjdk-alpine-musl:11 AS server-build
COPY src/main/java /usr/src/main
WORKDIR /usr/src/main
RUN find -name "*.java" > sources.txt
RUN javac @sources.txt