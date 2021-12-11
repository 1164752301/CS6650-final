package org.dbms.tools;

public class LastValSingleton {
    private Long lastId;
    private Operation lastVal;
    private static final LastValSingleton instance = new LastValSingleton();

    public static LastValSingleton getinstance() {
        return instance;
    }

    public LastValSingleton() {
        this.lastId = 0L;
        this.lastVal = null;
    }

    /**
     * Gets the value of lastId. *
     *
     * @return the value of lastId
     */
    public Long getLastId() {
        return lastId;
    }

    /**
     * Sets the lastId. *
     * <p>You can use setLastId() to set the value of lastId</p>
     * * @param lastId lastId
     */
    public void setLastId(Long lastId) {
        this.lastId = lastId;
    }

    /**
     * Gets the value of lastVal. *
     *
     * @return the value of lastVal
     */
    public Operation getLastVal() {
        return lastVal;
    }

    /**
     * Sets the lastVal. *
     * <p>You can use setLastVal() to set the value of lastVal</p>
     * * @param lastVal lastVal
     */
    public void setLastVal(Operation lastVal) {
        this.lastVal = lastVal;
    }
}
