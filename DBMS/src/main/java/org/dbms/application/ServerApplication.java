package org.dbms.application;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("org.dbms.relationship")
public class ServerApplication {

    public static void main(String[] args) {
        ApplicationContext app = SpringApplication.run(ServerApplication.class, args);
    }
}
