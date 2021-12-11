package org.dbms.tools;

import java.lang.reflect.Method;

public class ReflectionUtil {
  public static Method reflectMethod(Object obj, String methodName, Object methodArgs) {
    Method method = null;
    try {
      method = obj.getClass().getMethod(methodName, methodArgs.getClass());
    } catch (NoSuchMethodException e) {
      e.printStackTrace();
    }
    return method;
  }
}
