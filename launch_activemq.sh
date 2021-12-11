docker run --platform="linux/amd64" -p 61616:61616 -p 61613:61613 -p 8161:8161 --name mq_container --network weechat_network -i rmohr/activemq
