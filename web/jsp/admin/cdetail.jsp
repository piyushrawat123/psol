<%-- 
    Document   : cdetail
    Created on : Jun 25, 2017, 1:22:16 PM
    Author     : GHO$T
--%>
<%@include file="../includes/header.jsp" %>
<body class="homepage">
    <%@include file="../includes/topbar.jsp" %>
    <div class="container">
        <%=session.getAttribute("msg")%>
        <% session.setAttribute("msg", "");%>
        <div class="row">
            <div class="col-md-12">
                <div class="table-box">
                    <div class="table-boxbg">
                        <h1>Change Details<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <div  class="table-box col-md-6">
                        <form method="POST" class="form-horizontal" action="../../lgnsrv">
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg" placeholder="Enter Old password" type="password" name="ps" required="">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg" placeholder="New password" type="password" name="nps" required="">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg" placeholder="Confirm password" type="password" name="npsc" required="">                                    
                            </div>         
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg" hidden type="text" name="un" value="<%=session.getAttribute("uname")%>">                                    
                            </div>
                            <input hidden name="rt" value="2"/>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="btn-primary " value="submit" type="submit">
                            </div>
                        </form>
                    </div>
                    <div  class="table-box col-md-6">
                        <form method="POST" class="form-horizontal" action="../../lgnsrv">
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg" placeholder="Enter password" type="password" name="ps" required="">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg" placeholder="New Username" type="text" name="nun" required="">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg" hidden type="text" name="un" value="<%=session.getAttribute("uname")%>">                                    
                            </div>
                            <input hidden name="rt" value="3"/>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="btn-primary " value="submit" type="submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../includes/footer.jsp" %>
</body>
</html>