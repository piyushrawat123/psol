/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.util;

/**
 *
 * @author SINHA
 */
public class RUtil {
    
    
    public static int boolToInt(boolean x){
        return (x)?1:0;
    }
    
    public static boolean intToBool(int x){
        return (x>0)?true:false;
    }
    
    public static boolean strToBool(String x,boolean defaultVal){
       return (strToInt(x,(defaultVal==true)?1:0)>0)?true:false;
       
    }
    
    public static int strToInt(String str,int defaultVal){
        int retVal=defaultVal;
        try{
            retVal=Integer.parseInt(str);
        }catch(Exception e){
            retVal=defaultVal;
        }
        return retVal;
    }
     public static long strToLong(String str,long defaultVal){
        long retVal=defaultVal;
        try{
            retVal=Long.parseLong(str);
        }catch(Exception e){
            retVal=defaultVal;
        }
        return retVal;
    }
      public static double strToDouble(String str,double defaultVal){
        double retVal=defaultVal;
        try{
            retVal=Double.parseDouble(str);
        }catch(Exception e){
            retVal=defaultVal;
        }
        return retVal;
    }
      
    public static String doubleToStr(double val){
        String valStr=""+val;
        if(valStr.indexOf(".")>0) valStr=valStr.substring(0,valStr.indexOf("."));
        return valStr;
    }
    public static String formatString(String strVal,String defaultVal){
        strVal=(strVal==null)?defaultVal:strVal.trim();
        return strVal;
    }
}
