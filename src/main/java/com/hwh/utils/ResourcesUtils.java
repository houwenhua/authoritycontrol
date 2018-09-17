package com.hwh.utils;



import java.io.Serializable;
import java.util.*;

/**
 * 用于读取资源文件（*.properties）
 * @author hwh
 * @create 2018/9/17 10:55
 */
public class ResourcesUtils implements Serializable{
    private static final long serialVersionUID = -7657898714983901418L;

    //默认系统语言环境为中文
    private final static String LANGUAGE = "zh";

    //默认国家为中国
    private final static String COUNTRY = "CN";

    private static Locale getLocale(){
        Locale locale = new Locale(LANGUAGE, COUNTRY);
        return locale;
    }

    public static List<String> getKeyList(String baseName) {
        Locale locale = getLocale();
        ResourceBundle rb = ResourceBundle.getBundle(baseName,locale);
        List<String> keyList = new ArrayList<String>();
        Set<String> set = rb.keySet();
        for(String value : set) {
            keyList.add(value);
        }
        return keyList;
    }
}
