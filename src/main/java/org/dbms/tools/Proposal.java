package org.dbms.tools;


import org.dbms.tools.Operation;

import java.io.Serializable;

public class Proposal implements Serializable {
    private Long id;
    private Operation operation;

    public Proposal(Long id, Operation operation) {
        this.id = id;
        this.operation = operation;
    }

    /**
     * Gets the value of id. *
     *
     * @return the value of id
     */
    public Long getId() {
        return id;
    }

    /**
     * Sets the id. *
     * <p>You can use setId() to set the value of id</p>
     * * @param id id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Gets the value of operation. *
     *
     * @return the value of operation
     */
    public Operation getOperation() {
        return operation;
    }

    /**
     * Sets the operation. *
     * <p>You can use setOperation() to set the value of operation</p>
     * * @param operation operation
     */
    public void setOperation(Operation operation) {
        this.operation = operation;
    }
}
