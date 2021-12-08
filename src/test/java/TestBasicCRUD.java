import org.dbms.ServerApplication;
import org.dbms.relationship.domain.dao.service.IGroupService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

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
