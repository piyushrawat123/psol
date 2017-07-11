<%-- 
    Document   : addProduct
    Created on : Jun 23, 2017, 2:30:42 PM
    Author     : GHO$T
--%>
<%@page import="model.Category"%>
<%@page import="control.CategoryController"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
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
                        <h1>Add new Product<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <%
                        CategoryController catcon = new CategoryController();
                        ArrayList<Category> ctg = new ArrayList();
                        ctg = catcon.getCategories();
                    %>
                    <div  class="main-tablecustomer">
                        <form method="GET" class="form-horizontal" action="../../uppro" >
                            <div class="col-md-3" style="padding-bottom: 10px">
                                <input class="input-lg form-control" minlength="3" placeholder="Enter product name..." type="text" name="prodName" required="">                                    
                            </div>
                            <div class="col-md-3" style="padding-bottom: 10px">
                                <select class="form-control" name="catId" required="true">
                                    <option value="">-----Select Category-----</option>
                                    <% for (Category temp : ctg) {%>
                                    <option value="<%=temp.getCategoryId()%>"><%=temp.getCategoryName()%></option>
                                    <%}%>
                                </select>                         
                            </div>
                            <div class="col-md-3" style="padding-bottom: 10px">
                                <select class="form-control" name="fileType" required="true">
                                    <option value="">-----Select File Type-----</option>
                                    <option value="video">video</option>
                                    <option value="images">images</option>
                                    <option value="others">others</option>
                                </select>                         
                            </div>
                            <div class="col-md-3" style="padding-bottom: 10px">
                                <input class="input-lg form-control" minlength="3" placeholder="Enter image link..." type="text" name="prodFile">                                    
                                <div id="output" style="display: inline-block; top: 4px; position: relative ;border: dotted 1px #ccc; padding: 2px;"></div>
                            </div>
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <input class="input-lg form-control" value="" placeholder="For videos enter thumb link..." type="text" name="prodThumb">                                    
                            </div>
                            <div class=" col-md-8" style="padding-bottom: 10px;">
                                <textarea class="input-lg form-control" placeholder="Enter product description..." type="text" name="prodDesc" rows="6" cols="80"></textarea>
                            </div>
                            <div class="col-md-6 center-block" style="padding-bottom: 10px">
                                <input class="btn-primary form-control" value="submit" type="submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="table-box">
                    <div class="table-boxbg">
                        <h1>Upload CSV file<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <div  class="main-tablecustomer">
                        <form method="POST" class="form-horizontal" action="../../UploadCsv" enctype="multipart/form-data">

                            <div class="col-md-4" style="padding-bottom: 10px">
                                <select class="form-control" name="catId" required="true">
                                    <option value="">-----Select Category-----</option>
                                    <% for (Category temp : ctg) {%>
                                    <option value="<%=temp.getCategoryId()%>"><%=temp.getCategoryName()%></option>
                                    <%}%>
                                </select>                         
                            </div>
                            <div class="col-md-4" style="padding-bottom: 10px">
                                <span class="label-info" style="margin-top: 5px; margin-bottom: 5px;">Upload CSV file</span>
                                <input class="btn-file form-control" type="file" name="csvfile" required="">
                            </div>

                            <div class="col-md-6 center-block" style="padding-bottom: 10px">
                                <input class="btn-primary form-control" value="submit" type="submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="table-box">
                    <div class="table-boxbg">
                        <h1>All Products<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <div  class="main-tablecustomer">
                        <%
                            ProductController ob = new ProductController();
                            ArrayList<Product> alist = new ArrayList<>();
                            alist = ob.getAllProducts();
                        %>
                        <%="Total Products are " + alist.size()%>
                        <table id="tablenote" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="col-md-1">Prod ID</th>
                                    <th class="col-md-1">Cat ID</th>
                                    <th class="col-md-2">Name</th> 
                                    <th class="col-md-5">Description</th>
                                    <th class="col-md-1">File</th>
                                    <th class="col-md-1">File Type</th>
                                    <th class="col-md-2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%int i = 1;
                                    for (Product cat : alist) {
                                %>
                                <tr>
                                    <td><%= cat.getProductId()%></td>
                                    <td><%= cat.getCategoryId()%></td>
                                    <td><%= cat.getProductName()%></td> 
                                    <td><%= cat.getProductDesc()%></td>
                                    <td><%= cat.getProductFile()%></td>
                                    <td><%= cat.getProductFiletype()%></td>
                                    <td class="actions">
                                        <div class="action-buttons">
                                            <a class="fa fa-edit btn btn-success table-actions" href="updateProduct.jsp?pid=<%=cat.getProductId().toString().trim()%>" ></a>
                                        </div>
                                        <br/>
                                        <div class="action-buttons">
                                            <div class="table-actions" title="delete data" onclick="delData('<%= cat.getProductId()%>', '${pageContext.request.contextPath}');">
                                                <i class="fa fa-trash-o btn btn-danger"></i>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        if (i == 10) {
                                            i = 0;
                                        }
                                        i++;
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script>
        function getData(id)
        {
            query = query + "/uppro?prodId=" + document.getElementById("tablenote").rows[row].cells.item(0).innerHTML + "&catId=" +
                    document.getElementById("tablenote").rows[row].cells.item(1).innerHTML + "&prodName=" +
                    document.getElementById("tablenote").rows[row].cells.item(2).innerHTML + "&prodDesc=" +
                    document.getElementById("tablenote").rows[row].cells.item(3).innerHTML + "&prodFile=" +
                    document.getElementById("tablenote").rows[row].cells.item(4).innerHTML + "&fileType=" +
                    document.getElementById("tablenote").rows[row].cells.item(5).innerHTML;

            var xhr = new XMLHttpRequest();
            xhr.open("GET", query);
            xhr.send(null);
            window.location.reload();
        }
        function delData(row, query) {
            if (confirm("Do you really want to delete this?"))
            {
                query = query + "/ProdDelServ?prodId=" + row;
                var xhr = new XMLHttpRequest();
                xhr.open("GET", query);
                xhr.send(null);
                window.location.reload();
            }
        }

    </script>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#tablenote').dataTable();
        });
    </script>
</body>
</html>

