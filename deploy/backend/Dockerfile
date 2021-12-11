FROM bellsoft/liberica-openjdk-alpine-musl:11 AS server-build
COPY src/main/java /usr/src/main
WORKDIR /usr/src/main
RUN javac message/*.java paxos/*.java paxos/impl/*.java tools/*.java server/*.java client/*.java

FROM bellsoft/liberica-openjdk-alpine-musl:11 AS client-build
COPY src/main/java /usr/src/main
WORKDIR /usr/src/main
RUN javac message/*.java paxos/*.java paxos/impl/*.java tools/*.java server/*.java client/*.java