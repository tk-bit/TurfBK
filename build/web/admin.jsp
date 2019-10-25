<%-- 
    Document   : admin
    Created on : 2 Sep, 2019, 6:59:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getParameter("turfid")!=null){
            session.setAttribute("filterid",request.getParameter("turfid"));
            }
            if(request.getParameter("aid")!=null){
            session.setAttribute("mykey",request.getParameter("aid"));
            }
            response.sendRedirect("adminpg.jsp");
        %> 
    </body>
</html>