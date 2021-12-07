import org.dbms.relationship.ServerApplication;
import org.dbms.relationship.domain.dao.mapper.GroupMapper;
import org.dbms.relationship.domain.dao.service.IGroupService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestComponent;

import javax.annotation.Resource;

@SpringBootTest(classes = ServerApplication.class)
public class TestBasicCRUD {
    @Resource
    IGroupService groupService;

    @Test
    public void testList() {
        groupService.list();
    }


}
