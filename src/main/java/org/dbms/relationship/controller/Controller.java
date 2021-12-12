package org.dbms.relationship.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.message.domain.dao.service.IMessageService;
import org.dbms.message.domain.dto.AddMessageDto;
import org.dbms.tools.LastValSingleton;
import org.dbms.tools.PaxosResponse;
import org.dbms.tools.Proposal;
import org.dbms.relationship.domain.dao.entity.AddressEntity;
import org.dbms.relationship.domain.dao.entity.RelationshipEntity;
import org.dbms.relationship.domain.dao.service.IAddressService;
import org.dbms.relationship.domain.dao.service.IGroupService;
import org.dbms.relationship.domain.dao.service.IRelationshipService;
import org.dbms.relationship.domain.dto.AddRelationshipDto;
import org.dbms.relationship.domain.dto.ListRelationshipDto;
import org.dbms.tools.Operation;
import org.dbms.tools.ReflectionUtil;
import org.dbms.tools.Response;
import org.dbms.util.CommonUtils;
import org.dbms.util.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.*;

@RestController
@RequestMapping("/dbms")
@CrossOrigin(origins = "*")
public class Controller {
    @Resource
    IGroupService groupService;

    @Resource
    IRelationshipService relationshipService;

    @Resource
    IAddressService addressService;

    private static LastValSingleton lastValSingleton = LastValSingleton.getinstance();

    private static final Logger logger = LoggerFactory.getLogger(Controller.class);

    @PostMapping("/relationship/add")
    @ResponseBody
    public Response addRelationship(@RequestBody AddRelationshipDto addRelationshipDto) {
            Response executionInfo = prepareAndPropose(new Operation("addRelationship", addRelationshipDto));
        if (executionInfo.getCode() == 0) {
            return new Response(
                    0, String.format("Group %s is successfully created", addRelationshipDto.getGroupName()), null);
        } else {
            return new Response(
                    1, String.format("Group %s is successfully created", addRelationshipDto.getGroupName()), null);
        }

    }

    @PostMapping("/relationship/join")
    @ResponseBody
    public JSONObject joinGroup(@RequestBody RelationshipEntity relationshipEntity) {
        relationshipService.save(relationshipEntity);
        return JSONUtil.success(new JSONObject());
    }

    @PostMapping("/relationship/remove")
    @ResponseBody
    public JSONObject removeRelationship(@RequestBody RelationshipEntity relationshipEntity) {
        relationshipService.removeById(relationshipEntity.getId());
        return JSONUtil.success(new JSONObject());
    }

  @PostMapping("/relationship/list")
  @ResponseBody
  public JSONObject listRelationship(@RequestBody ListRelationshipDto listRelationshipDto) {
    return relationshipService.listRelationship(listRelationshipDto);
        }

        @PostMapping("/paxos/bind")
    @ResponseBody
    public Boolean bind(@RequestBody AddressEntity addressEntity) {
        return addressService.save(addressEntity);
        }

    private Response prepareAndPropose(Operation originalOperation) {
        logger.info(String.format("started to prepare for operation %s", originalOperation.getId()));
        logger.info(originalOperation.getClazz());
        Operation operation = null;
        Long id = null;
        while (true) {
            id = System.currentTimeMillis();
            Map<Operation, Integer> votes = new HashMap<>();
            List<AddressEntity> addressEntities = addressService.list();
            for (AddressEntity accepter : addressEntities) {
                Long finalId = id;
                String url = String.format("http://%s:%s/dbms/paxos/promise", accepter.getIp(), accepter.getPort());
                    String result = CommonUtils.postCommon(url, null, finalId.toString(), null);
                    JSONObject resObj = JSON.parseObject(result);
                    if (Objects.isNull(resObj) || resObj.getLong("id") > id) {
                        continue;
                    }
                    Operation operation1 = resObj.getObject("value", Operation.class);
                votes.put(operation1, votes.getOrDefault(operation1, 0) + 1);
            }
            if (votes.entrySet().size() == 0) {
                logger.info(String.format("Received no response, retrying", id));
                continue;
            }
            Map.Entry<Operation, Integer> entry = Collections.max(votes.entrySet(), Comparator.comparingInt(Map.Entry::getValue));
            if (entry.getValue() >= addressEntities.size() / 2) {
                if (votes.entrySet().size() > 1 || !votes.containsKey(null)) {
                    operation = entry.getKey();
                    logger.info(String.format("Process operation %s first", operation.getId()));
                } else {
                    operation = originalOperation;
                    logger.info(String.format("Started to process operation %s", operation.getId()));
                }
                break;
            }
        }
        propose(id, operation);
        if (!operation.equals(originalOperation)) {
            prepareAndPropose(originalOperation);
        }
        return new Response(0, "Finished updating", null);
    }

  private void propose(Long id, Operation operation) {
      logger.info(String.format("Started to propose proposal %s", id));
      logger.info(operation.getClazz());
    Proposal proposal = new Proposal(id, operation);
    Integer count = 0;
    List<AddressEntity> addressEntities = addressService.list();
    for (AddressEntity accepter : addressEntities) {
      String url = String.format("http://%s:%s/dbms/paxos/accept", accepter.getIp(), accepter.getPort());
      JSONObject obj = new JSONObject();
      obj.put("id", proposal.getId());
      JSONObject opeObj = new JSONObject();
      opeObj.put("args", proposal.getOperation().getArgs());
      opeObj.put("id", proposal.getOperation().getId());
      opeObj.put("method", proposal.getOperation().getMethod());
      obj.put("opertion", opeObj);
      String result = CommonUtils.postCommon(url, null, obj.toJSONString(), null);
      Boolean res = Boolean.parseBoolean(result);
      if (Objects.isNull(res)) {
          continue;
      }
      if (res) {
        count += 1;
      }
    }
      if (count >= addressEntities.size() / 2) {
          logger.info(String.format("Proposal %s is accepted", id));
          broadcast(operation);
      } else {
          logger.info(String.format("Proposal %s is rejected, retrying.", id));
          prepareAndPropose(operation);
      }
        }

    private void broadcast(Operation operation) {
        logger.info(String.format("Started to broadcast opertation %s", operation.getId()));
        logger.info(operation.getClazz());
        List<AddressEntity> addressEntities = addressService.list();
        for (AddressEntity learner : addressEntities) {
            String url = String.format("http://%s:%s/dbms/paxos/learn", learner.getIp(), learner.getPort());
            JSONObject opeObj = new JSONObject();
            opeObj.put("args", JSON.toJSONString(operation.getArgs()));
            opeObj.put("id", operation.getId());
            opeObj.put("method", operation.getMethod());
            opeObj.put("clazz", operation.getClazz());
            Boolean res = Boolean.parseBoolean(CommonUtils.postCommon(url, null, opeObj.toJSONString(), null));
        }
        logger.info(String.format("Finished to broadcast opertation %s", operation.getId()));
    }



    private Response execute(JSONObject operation) throws ClassNotFoundException {
        logger.info(operation.toJSONString());
        String id = operation.getString("id");
        String clazz = operation.getString("clazz");
        logger.info("prev");
        try{
            Object args = JSON.parseObject(operation.getString("args"), Class.forName(clazz));
            logger.info("past");
            String methodName = operation.getString("method");
            logger.info(String.format("Start to execute operation %s", id));
            Method method = ReflectionUtil.reflectMethod(relationshipService, methodName, args);
            logger.info(methodName);
            try {
                method.invoke(relationshipService, args);
                logger.info(String.format("Finished executing operation %s", id));
                return new Response(0, "Finished executing operation %s", null);
            } catch (IllegalAccessException | InvocationTargetException e) {
                logger.error(e.getMessage());
                logger.info(String.format("Failed executing operation %s", id));
                return new Response(1, "Failed executing operation %s", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Response(1, "Failed executing operation %s", null);
    }

    @PostMapping("/paxos/learn")
    @ResponseBody
    public Boolean learn(@RequestBody JSONObject operation) {
        try {
            execute(operation);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @PostMapping("/paxos/promise")
    @ResponseBody
    public PaxosResponse promise(@RequestBody Long id) {
        logger.info(String.format("started to promise proposal %s", id));
        PaxosResponse response = new PaxosResponse();
        if (lastValSingleton.getLastId() < id) {
            lastValSingleton.setLastId(id);
        }
        response.setId(lastValSingleton.getLastId());
    response.setValue(lastValSingleton.getLastVal());
        logger.info(String.format("finished to promise proposal %s", id));
        return response;
    }

    @PostMapping("/paxos/accept")
    @ResponseBody
    public Boolean accept(@RequestBody Proposal proposal) {
        logger.info(String.format("started to accept proposal %s", proposal.getId()));

    Long lastId = lastValSingleton.getLastId();
        Operation lastVal = lastValSingleton.getLastVal();

        if (!lastId.equals(proposal.getId())) {
            lastValSingleton.setLastVal(proposal.getOperation());
            logger.info(String.format("rejected proposal %s", proposal));
            return false;
        }
        lastValSingleton.setLastVal(null);
        lastValSingleton.setLastId(0L);
        logger.info(String.format("accepted proposal %s", proposal.getId()));
        return true;
    }


/**
 * ********************** Message *****************
 */

@Resource
IMessageService messageService;

    @PostMapping("/message/add")
    @ResponseBody
    public JSONObject addMessage(@RequestBody AddMessageDto addmessageDto) throws IOException {
        System.out.println("received add message: " + addmessageDto.toString());
        MessageEntity messageEntity = (MessageEntity) addmessageDto.toEntity();
        messageEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));

        prepareAndPropose(new Operation("addMessage", messageEntity));

        return JSONUtil.success(new JSONObject());
    }


    @PostMapping("/message/list")
    @ResponseBody
    public JSONObject listMessage(@RequestBody JSONObject chatRoomId) {
        Long id = Long.parseLong(chatRoomId.getString("chatRoomId"));
        System.out.println("Received list message request with groupId: " + chatRoomId);
        List<MessageEntity> messageEntityList = messageService.list();

        List<MessageEntity> res = new ArrayList<>();

        for (MessageEntity messageEntity : messageEntityList) {
            Long currGroupId = messageEntity.getGroupId();
            if (currGroupId.equals(id)) {
                res.add(messageEntity);
            }
        }

        System.out.println("list mesaage size" + res.size());

        res.sort((o1, o2) ->
                o1.getCreateTime().before(o2.getCreateTime())?1:
                        o1.getCreateTime().equals(o2.getCreateTime())? 0:-1);

        JSONObject result = new JSONObject();
        JSONArray data = new JSONArray();
        for (MessageEntity messageEntity : res) {
            data.add(messageEntity.toJSON());
        }
        result.put("datas", data);
        System.out.println("list message / send to front end: " + result);
        return JSONUtil.success(result);

    }

}
