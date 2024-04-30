package com.origin.util;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateConvert implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        //TODO 日期string转Date
        SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sFormat.parse(s);
            System.out.println(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
