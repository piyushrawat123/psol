<%-- 
    Document   : updateProduct
    Created on : Jun 23, 2017, 11:41:26 PM
    Author     : GHO$T
--%>

<%@page import="java.util.ArrayList"%>
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
                        int proid = Integer.parseInt(request.getParameter("pid"));
                        CategoryController catcon = new CategoryController();
                        ArrayList<Category> ctg = new ArrayList();
                        ctg = catcon.getCategories();
                        ProductController procon = new ProductController();
                        Product product = new Product();
                        product = procon.getProductbyProductId(proid);
                    %>
                    <div  class="main-tablecustomer">
                        <form method="GET" class="form-horizontal" action="../../uppro">
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg form-control" readonly="true" minlength="3" value="<%=product.getProductId()%>" placeholder="Enter product id..." type="text" name="prodId" required="">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <select class="form-control" name="catId" required="true">
                                    <option value="<%=product.getCategoryId()%>"><%=catcon.getCategory(product.getCategoryId()).getCategoryName()%></option>
                                    <% for (Category temp : ctg) {
                                            if (temp.getCategoryId() != product.getCategoryId()) {%>
                                    <option value="<%=temp.getCategoryId()%>"><%=temp.getCategoryName()%></option>
                                    <%}
                                        }%>
                                </select>                         
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg form-control" minlength="3" value="<%=product.getProductName()%>" placeholder="Enter product name..." type="text" name="prodName" required="">                                    
                            </div>
                            <div class=" col-md-7" style="padding-bottom: 10px">
                                <textarea class="input-lg form-control" placeholder="Enter product description..." type="text" name="prodDesc" rows="7" cols="50"><%=product.getProductDesc()%></textarea>
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <select class="form-control" name="fileType" required="true">
                                    <%if (product.getProductFiletype().equalsIgnoreCase("video")) { %>
                                    <option selected value="video">video</option>
                                    <option value="images">images</option>
                                    <option value="others">others</option>
                                    <%} else if (product.getProductFiletype().equalsIgnoreCase("images")) {%>
                                    <option value="video">video</option>
                                    <option selected value="images">images</option>
                                    <option value="others">others</option>
                                    <%} else {%>
                                    <option value="video">video</option>
                                    <option value="images">images</option>
                                    <option selected value="others">others</option>
                                    <%}%>
                                </select>                         
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg form-control" minlength="3" placeholder="Enter image link..." type="text" value="<%=product.getProductFile()%>" name="prodFile">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="input-lg form-control" value="<%=product.getProductThumb()%>" placeholder="For videos enter thumb link..." type="text" name="prodThumb">                                    
                            </div>
                            <div class="col-md-7" style="padding-bottom: 10px">
                                <input class="btn-primary form-control" value="submit" type="submit">
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

