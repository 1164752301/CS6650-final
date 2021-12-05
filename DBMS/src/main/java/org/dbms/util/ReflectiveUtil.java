package org.dbms.util;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.annotation.TableField;

import java.lang.reflect.Field;
import java.util.HashMap;

public class ReflectiveUtil {
    public static HashMap<String, Object> object2Map(Object onClass) {
        HashMap<String, Object> hashMap = new HashMap<>();
        Field[] fields = onClass.getClass()
                .getDeclaredFields();
        for (Field field : fields) {
            //反射时让私有变量变成可访问
            field.setAccessible(true);
            try {
                if (field.isAnnotationPresent(TableField.class)) {
                    hashMap.put(field.getAnnotation(TableField.class).value(), field.get(onClass));
                }
                else {
                    hashMap.put(field.getName(), field.get(onClass));
                }

            }
            catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return hashMap;
    }

    public static <T> T copyToClass(Object src, Class<T> clazzT) throws RuntimeException {
        try {
            T target = clazzT.newInstance();
            BeanUtil.copyProperties(src, target);
            return target;
        }
        catch (Exception e) {
            throw new RuntimeException(String.format("copy obj %s to class %s failed, error:%s", src.toString(),
                    clazzT.toString(),
                    e.getMessage()));
        }
    }
}
