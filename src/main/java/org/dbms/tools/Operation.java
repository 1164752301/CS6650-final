package org.dbms.tools;

import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Data
public class Operation implements Serializable {
    private String method;
    private Object args;
    private UUID id;
    private String clazz;

    public Operation(String method, Object args) {
        this.id = UUID.randomUUID();
        this.method = method;
        this.args = args;
        this.clazz = args.getClass().getName();
    }

    /**
     * Gets the value of method. *
     *
     * @return the value of method
     */
    public String getMethod() {
        return method;
    }

    /**
     * Gets the value of args. *
     *
     * @return the value of args
     */
    public Object getArgs() {
        return args;
    }

    /**
     * Sets the id. *
     * <p>You can use setId() to set the value of id</p>
     * * @param id id
     */
    public void setId(UUID id) {
        this.id = id;
    }

    /**
     * Gets the value of id. *
     *
     * @return the value of id
     */
    public UUID getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Operation{" +
                "method='" + method + '\'' +
                ", args=" + args +
                ", id=" + id +
                '}';
    }
}
