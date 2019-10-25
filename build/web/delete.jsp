<%-- 
    Document   : delete
    Created on : 7 Sep, 2019, 1:50:39 AM
    Author     : Admin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <%
            String id = session.getAttribute("filterid").toString();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
                Statement st = conn.createStatement();
                int i = st.executeUpdate("delete from turf where turfid="+id+" and turfid not in(1,2,3)");
                if (i == 1) {
                %>
                <script type="text/javascript">
                    alert("Turf [ id=" + <%=id%> + " ] Deleted Successfully!");
                    window.close();
                </script>
                <%
                }else{out.println("Sorry! Couldn't delete that :(");}
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
