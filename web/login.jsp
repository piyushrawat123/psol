<%-- 
    Document   : login
    Created on : Jun 25, 2017, 12:12:33 PM
    Author     : GHO$T
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Login Form</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link href="resourceadmin/css/style.css" rel="stylesheet" type="text/css"/>
        <%
            if (session.getAttribute("uname") != null) {
                response.sendRedirect("admnpnl.jsp");
            }
        %>
    </head>
    <body>
        <div class="login">
            <%      if (session.getAttribute("msg") == null) {
                    session.setAttribute("msg", "");
                }
            %>
            <%=session.getAttribute("msg")%>
            <% session.setAttribute("msg", "");%>
            <h1>Login</h1>

            <form method="POST" action="lgnsrv">
                <input type="text" name="un" placeholder="Username" required="required" />
                <input type="password" name="ps" placeholder="Password" required="required" />
                <input hidden name="rt" value="1"/>
                <button type="submit" class="btn btn-primary btn-block btn-large">Let me in.</button>
            </form>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</html>
