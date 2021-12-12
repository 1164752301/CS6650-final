# Mannual of Final
## Overview
This project implements a simple instant messaging application.

## Features
1. Implemented with Springboot framework
2. Implemented Paxos to ensure fault-tolerance
3. Information of all participants are recorded in address table
4. Project is deployed in bundle(1 server + 1 mq + 1 database)
5. Instances communicate in local network
6. Used mybatis-plus to help communicating with database.
7. Used lombok to cut down the cost of writing pojos.
8. A whole bundle can be deployed with one script.
9. Used Reflection to generify Paxos process.
10. Communication is implemented with message passing.
11. Used activeMQ to push messages to frontend.
12. Timeout is currently set to 2000 milliseconds, can be edited all together.
13. Current deploy script is made for macOS and Linux, need some adjustment
if you want to apply it on other platforms.
    

##Swagger
To visit the swagger page of this project, please visit localhost:30001/swagger-ui.html.
##Deploy Notes
1. Please generate the image and network first with deploy.sh
   2. Each execution of run_bundle.sh generates a new bundle.
3. This project is wrote up with JDK 1.8_291.
4. The status code 0 indicates success and the status code 1 indicates failure.
5. Initially we configure server1-server5 in our sql script, also configured in frontend. Can be improved.

## Server
Backend is splitted into two modules: relationship and message.
Relationship:
Manage the information related to relations and groups, 
can be easily improved to support functionality of join and remove group.

Message:
Connect ActiveMQ server with TCP, also support functionality of
getting history.
