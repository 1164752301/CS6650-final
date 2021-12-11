package org.dbms.tools;

import java.io.Serializable;

/**
 * This class represents the response to client, which is composed of a response message and a status code.
 * Status code should be 0 if successful else 1;
 */
public class Response implements Serializable {
    private int code;
    private String msg;
    private String core;

    public Response(int code, String msg, String core) {
        this.code = code;
        this.msg = msg;
        this.core = core;
    }

    @Override
    public String toString() {
        return "Response{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                '}';
    }

    /**
     * Gets the value of code. *
     *
     * @return the value of code
     */
    public int getCode() {
        return code;
    }

    /**
     * Gets the value of msg. *
     *
     * @return the value of msg
     */
    public String getMsg() {
        return msg;
    }

    /**
     * Gets the value of core. *
     *
     * @return the value of core
     */
    public String getCore() {
        return core;
    }
}
