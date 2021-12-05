package org.dbms.util;

import com.alibaba.fastjson.JSONObject;

public class JSONUtil {
    public static JSONObject success(JSONObject jsonObject) {
        jsonObject.put("code", 0);
        jsonObject.put("alert", "success");
        return jsonObject;
    }

    public static JSONObject fail(JSONObject jsonObject) {
        jsonObject.put("code", 0);
        jsonObject.put("alert", "fail");
        return jsonObject;
    }
}
