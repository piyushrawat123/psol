<%-- 
    Document   : logout
    Created on : Jun 25, 2017, 1:50:01 PM
    Author     : GHO$T
--%>

<%
    session.invalidate();
    response.sendRedirect("../../login.jsp");
%>