<%-- 
    Document   : updateCategory
    Created on : Jun 23, 2017, 11:35:22 PM
    Author     : GHO$T
--%>

<%@page import="model.Category"%>
<%@page import="control.CategoryController"%>
<%@page import="model.Product"%>
<%@page import="control.ProductController"%>
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
                        <h1>Update Product<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <%
                        int cid = Integer.parseInt(request.getParameter("cid"));
                        CategoryController procon = new CategoryController();
                        Category category = new Category();
                        category = procon.getCategory(cid);
                    %>
                    <div  class="main-tablecustomer">
                        <form method="GET" class="form-horizontal" action="../../catcon">
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg form-control" readonly="true" minlength="3" value="<%=category.getCategoryId()%>" name="catId">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg form-control" minlength="3" value="<%=category.getCategoryName()%>" placeholder="Enter category name..." type="text" name="catName" required="">                                    
                            </div>
                            <div class=" col-md-7" style="padding-bottom: 10px">
                                <textarea class="input-lg form-control" placeholder="Enter category description..." type="text" name="catDesc" rows="7" cols="50"><%=category.getCategoryDesc()%></textarea>
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="btn-primary form-control" value="Update" type="submit">
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

