package org.dbms;

import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.net.Socket;

@Slf4j
public class BIOClient {

    public BIOClient() {
    }

    public void send() throws IOException {
        System.out.println("starting to send to mq");
        Socket s = new Socket("localhost", 1234);

        InputStream input = s.getInputStream();
        OutputStream output = s.getOutputStream();

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(output));
        bw.write("Client sends message test to server\n");  //Send a message to the server side
        bw.flush();
        System.out.println("Successfully send to tcp server");
    }
}