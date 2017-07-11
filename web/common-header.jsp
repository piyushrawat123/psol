<%@page import="model.Link"%>
<%@page import="control.LinkController"%>
<%@page import="net.util.RandomGenerator"%>
<%@page import="model.IPPool"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="net.util.RUtil"%>

<head>
 <jsp:useBean id="wapReq" class="net.common.service.CommonService" scope="request"/>
<jsp:useBean id="conn" class="connection.ConnectionProvider" scope="request"/>

<%!
public String getMsisdnHeaderName(java.util.Enumeration<String> headerList){
    String headerName="";
    try{
        String temp="";
        while(headerList.hasMoreElements()){
           temp=headerList.nextElement(); 
           if(temp.equalsIgnoreCase("MSISDN")|| temp.equalsIgnoreCase("X-nokia-msisdn")
                   || temp.equalsIgnoreCase("X-MSISDN") || temp.equalsIgnoreCase("HTTP_MSISDN")
                   || temp.equalsIgnoreCase("HTTP_X_NOKIA_MSISDN") || temp.equalsIgnoreCase("HTTP_X_MSISDN") 
                   || temp.equalsIgnoreCase("User-Identity-Forward-msisdn") || temp.equalsIgnoreCase("cli")){
               headerName=temp;
               break;
           }
        }
    }catch(Exception e){
        headerName="msisdn";
    }
    return headerName;
}
public String invokeURL(String url1){
        String urlResp = "";
        String loggerHead=" sdp:amazon invokeURL() :: ";
            long initTime=System.currentTimeMillis(); 
        try{
            System.out.println(loggerHead+"Invoking URL "+url1);
           
            java.net.URL url =  new java.net.URL(url1);
            java.net.HttpURLConnection urlConn = (java.net.HttpURLConnection)url.openConnection();
            urlConn.setUseCaches(false);
            urlConn.setDoInput(true);
            urlConn.setDoOutput(true);
            urlConn.connect();
           /* java.io.DataOutputStream  os=new DataOutputStream(urlConn.getOutputStream());
            os.write(data.getBytes());
            */
            int statusCode = urlConn.getResponseCode();
            System.out.println(loggerHead+" URL Connected, Status Code : "+statusCode);
            java.io.DataInputStream dis = new java.io.DataInputStream(urlConn.getInputStream());
            System.out.println(loggerHead+" Input Stream Opened ....Reading Response.....");
            int x = 0;
            while ((x = dis.read()) != -1) {
                urlResp = urlResp + (char) x;
            }
            System.out.println(loggerHead+" Data from URL : "+urlResp);
            //os.close();
            
            dis.close();
            dis = null;
            urlConn.disconnect();
            urlConn = null;
            url = null;
            
        } catch (Exception e) {
            System.out.println(loggerHead+" Exception "+e.getMessage());
            urlResp = urlResp + "-101";
        }
        long urlResponseTime=System.currentTimeMillis()-initTime;
        System.out.println(loggerHead+" URL Response "+urlResp+" | Response Time (In Millis="+urlResponseTime+", In Seconds="+(urlResponseTime/1000)+") ");
        return urlResp;

    }
%>
<%
boolean subst=false;
String randNum1=RandomGenerator.randomAlphaNumeric(10);
String randNum2=RandomGenerator.randomAlphaNumeric(11);
String randNum3=RandomGenerator.randomAlphaNumeric(9);
String randNum4=RandomGenerator.randomAlphaNumeric(12);
String randNum5=RandomGenerator.randomAlphaNumeric(13);
int serviceId = RUtil.strToInt(request.getParameter("sid"), 1);
String gwIPAddr=RUtil.formatString("180.151.86.180", "180.151.86.180");

Enumeration<String> en=request.getHeaderNames();
			StringBuilder headersStr=new StringBuilder();
			
			
			while(en.hasMoreElements()){
				String key=en.nextElement();
				headersStr.append(key+"="+request.getHeader(key)+" ,");
			}
                      




//49.14.224.0
//180.151.86.180
IPPool gatewayIP=(IPPool)wapReq.findOperatorByIp(gwIPAddr);

String msisdn1=request.getHeader(getMsisdnHeaderName(request.getHeaderNames()));

 String url="http://silk69.in/silk/cnt//subscriber/status?msisdn="+msisdn1;
                       long timeamazon = System.currentTimeMillis();
                        String httpResp="";
                       if(msisdn1!=null){
               httpResp = invokeURL(url);
                       }
                 System.out.println(":::httpResp::"+ httpResp);
                  boolean subscriberStatus=true;
   if(httpResp.equalsIgnoreCase("SUBSCRIBED")){
   subscriberStatus=true;
   subst=subscriberStatus;
   }
   Link ldata=new Link();
   if(subst)
   {
       LinkController ob=new LinkController();
       ldata=ob.getLink();
   }
   String dlink="file:///"+getServletContext().getInitParameter("upload.location");
   
%>