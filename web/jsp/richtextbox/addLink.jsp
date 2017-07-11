<%-- 
    Document   : addLink
    Created on : Jul 4, 2017, 9:23:49 PM
    Author     : GHO$T
--%>

<%@page import="model.Link"%>
<%@page import="control.LinkController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                        <h1>Add/Update Link<span class="border-topbg"></span> </h1>
                        <span class="table-icon"><img src="../../resourceadmin/images/table-icon.jpg"></span>
                    </div>
                    <%
                        LinkController ob = new LinkController();
                        Link ldata=new Link();
                        ldata = ob.getLink();
                    %>
                    <form method="GET" class="form-horizontal" action="../../LinkServ">
                        <input hidden="" value="<%=ldata.getIdlink()%>" name="tid">
                        <div id="sample">
                            <textarea id="myArea1" style="width: 1000px; height: 300px; background-color: white; " name="datal">
                                <%=ldata.getLinkData()%>
                            </textarea>
                            <script src="../../resourceadmin/js/nicEdit.js" type="text/javascript"></script>
                            <script>
                                var area1, area2;

                                function toggleArea1() {
                                    if (!area1) {
                                        area1 = new nicEditor({fullPanel: true}).panelInstance('myArea1', {hasPanel: true});
                                    } else {
                                        area1.removeInstance('myArea1');
                                        area1 = null;
                                    }
                                }

                                function addArea2() {
                                    area2 = new nicEditor({fullPanel: true}).panelInstance('myArea2');
                                }
                                function removeArea2() {
                                    area2.removeInstance('myArea2');
                                }

                                bkLib.onDomLoaded(function () {
                                    toggleArea1();
                                });
                            </script>	
                        </div>
                        <div class="col-md-6 center-block" style="padding-bottom: 10px">
                            <input class="btn-primary form-control" value="submit" type="submit">
                        </div>
                    </form>
                    <%@include file="../includes/footer.jsp" %>
                    </body>
                    </html>