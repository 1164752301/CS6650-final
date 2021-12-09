package org.dbms;

import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.net.Socket;

@Slf4j
public class BIOClient {

    public BIOClient() {
    }

    public void send(String jsonStr) throws IOException {
        System.out.println("starting to send to mq, msg: " + jsonStr);
        Socket s = new Socket("localhost", 35000);

        OutputStream output = s.getOutputStream();

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(output));
        bw.write(jsonStr);  //Send a message to the server side
        bw.flush();
        System.out.println("Successfully send to tcp server");
    }
}