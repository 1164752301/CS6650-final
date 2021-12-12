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
12. Timeout is currently set to 10000 milliseconds, can be edited all together.

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

# Executive Summary
## Assignment Overview
This assignment concentrates mainly on one topic, which is Paxos.
We need to implement a Paxos algorithm to ensure the fault-tolerance of our service. It works in this way:
When a proposer receives a request from client, it sends requests to all accepters bound to it and check whether there is any unfinished proposal which takes majority. If it is, the proposer finish that proposal first and then come back to its original proposal. Otherwise, it attaches the original operation and ask the accepters to accept it. If an accepter finds that the new proposal is not the same one which last visited it, if it is, then it accepts, otherwise, reject it. After it accepts, this proposal is finished for it so it can clear the record. Otherwise, keep the record of this operation and leave it to a later proposal. When a proposal is approved, it should be broadcast to all learners so that the result can be saved.


## Technical impression
1. For the fail simulation, I used a thread way. When accept or promise is called, it has 20 percent of chance to fall into a sleep and result in a timeout.
2. The bind methods are in proposer class. When a server is instantiated, its proposer ask the designated accepters and learners to bind to it, then its accepter and learner bind to the designated proposers. In that way, when a new server is instantiated, we can customize which servers it should connect with.
3. Value is encapsulated into an object called 'Operation' which get us rid of parsing the string value.
4. I assume that an accepter is always a learner in my implementation so that accepter only works in the vote phase and the executing work is only done by learners. Otherwise, when a learner is also an accepter, the operation may be executed twice.
