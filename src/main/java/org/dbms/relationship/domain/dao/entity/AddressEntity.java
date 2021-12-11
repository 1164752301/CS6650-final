package org.dbms.relationship.domain.dao.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("address")
public class AddressEntity {
    private String ip;
    private Integer port;
    private Long id;

    public AddressEntity(String ip, Integer port) {
        this.ip = ip;
        this.port = port;
    }

    /**
     * Gets the value of host. *
     *
     * @return the value of host
     */
    public String getIp() {
        return ip;
    }

    /**
     * Gets the value of port. *
     *
     * @return the value of port
     */
    public Integer getPort() {
        return port;
    }
}
