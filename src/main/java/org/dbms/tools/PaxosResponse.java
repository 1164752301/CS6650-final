package org.dbms.tools;


import org.dbms.tools.Operation;

import java.io.Serializable;

public class PaxosResponse implements Serializable {
    private Long id;
    private Operation value;

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
     * Gets the value of value. *
     *
     * @return the value of value
     */
    public Operation getValue() {
        return value;
    }

    /**
     * Sets the value. *
     * <p>You can use setValue() to set the value of value</p>
     * * @param value value
     */
    public void setValue(Operation value) {
        this.value = value;
    }
}
