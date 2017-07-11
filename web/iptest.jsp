<%@page import="model.IPPool"%>
<%@page import="net.common.service.CommonService"%>
<%
CommonService commonService=new CommonService();
//49.14.224.0
//180.151.86.180
IPPool ipPool=(IPPool)commonService.findOperatorByIp("223.238.9.0");

out.println("ip:::::"+ipPool.getIpAddress());

%>