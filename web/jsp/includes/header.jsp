<%-- 
    Document   : header
    Created on : Jun 23, 2017, 11:09:19 PM
    Author     : GHO$T
--%>


<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Dashboard</title>
        <!-- core CSS -->

        <script src="../../resourceadmin/js/jquery.js"></script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>    
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../resourceadmin/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../resourceadmin/css/main.css" rel="stylesheet">
        <link href="../../resourceadmin/css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="../../resourceadmin/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../resourceadmin/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../resourceadmin/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../resourceadmin/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../../resourceadmin/images/ico/apple-touch-icon-57-precomposed.png">
        <%
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("../../login.jsp");
            }
        %>
    </head>
