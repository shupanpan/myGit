package com.fh.shop.admin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static final String Y_M_D = "yyyy-MM-dd";
    public static  final String YMD_HMS = "yyyy-MM-dd HH:mm:ss";

        public static String convertDate2Str(Date date,String parttern){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(parttern);
        return  simpleDateFormat.format(date);
    }

    public static Date convertStr2Date(String str,String parttern){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(parttern);
        try {
            return simpleDateFormat.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  null;
    }
}
