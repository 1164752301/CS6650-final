package org.dbms;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("org.dbms")
@MapperScan({"org.dbms.relationship.domain.dao.mapper", "org.dbms.message.domain.dao.mapper"})
public class ServerApplication {

    public static void main(String[] args) {
        ApplicationContext app = SpringApplication.run(ServerApplication.class, args);
    }
}
