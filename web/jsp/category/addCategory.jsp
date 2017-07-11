<%-- 
    Document   : addCategory
    Created on : Jun 23, 2017, 2:30:29 PM
    Author     : GHO$T
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="control.CategoryController"%>
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
                        <h1> Create new category<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <div  class="main-tablecustomer">
                        <form class="form-horizontal" action="../../catcon">
                            <div class="col-md-3" style="padding-bottom: 10px">
                                <input class="input-lg" minlength="3" placeholder="Enter category name..." type="text" name="catName" required="">                                    
                            </div>
                            <div class=" col-md-6" style="padding-bottom: 10px">
                                <textarea class="input-lg" placeholder="Enter category description..." type="text" name="catDesc" rows="7" cols="50"></textarea>
                            </div>
                            <div class="col-md-3">
                                <input class="btn-primary" value="Add" type="submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="table-box">
                    <div class="table-boxbg">
                        <h1>Categories<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <div  class="main-tablecustomer">
                        <%
                            CategoryController ob = new CategoryController();
                            ArrayList<Category> alist = new ArrayList<>();
                            alist = ob.getCategories();
                        %>
                        <%="Total Categories are " + alist.size()%>
                        <table id="tablenote" name="table2" class="table table-striped table-bordered table-hover" cellpadding="0" cellspacing="0" border="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="col-md-1">ID</th>
                                    <th class="col-md-3">Name</th> 
                                    <th class="col-md-6">Description</th>
                                    <th class="col-md-2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int i = 1;
                                    for (Category cat : alist) {

                                %>
                                <tr>
                                    <td id="catids"><%= cat.getCategoryId()%></div></td>
                                    <td id="catnames"><%= cat.getCategoryName()%></td> 
                                    <td id="catdesc"><%= cat.getCategoryDesc()%></td>
                                    <td class="actions">
                                        <div class="action-buttons">
                                            <div class="action-buttons">
                                                <a class="fa fa-edit btn btn-success table-actions" href="updateCategory.jsp?cid=<%=cat.getCategoryId().toString().trim()%>" ></a>
                                            </div>
                                            <br/>
                                            <div class="table-actions" title="delete data" onclick="delData('<%= cat.getCategoryId()%>', '${pageContext.request.contextPath}');">
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

                                    }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function getData(row, query) {
            query = query + "/catcon?catId=" + document.getElementById("tablenote").rows[row].cells.item(0).innerHTML + "&catName=" +
                    document.getElementById("tablenote").rows[row].cells.item(1).innerHTML + "&catDesc=" +
                    document.getElementById("tablenote").rows[row].cells.item(2).innerHTML;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", query);
            xhr.send(null);
            window.location.reload();
        }
        function delData(row, query) {
            if (confirm("Do you really want to delete this?"))
            {
                query = query + "/CatDelServ?catId=" + row;
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

