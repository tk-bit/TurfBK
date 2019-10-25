<%-- 
    Document   : registration
    Created on : 10 Jul, 2019, 2:24:10 PM
    Author     : Admin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="styl.css">

    </head>
    <body>
        <%
            String first_name = request.getParameter("fname");
            String contact = request.getParameter("user");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass2");
            try
{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
        Statement st = conn.createStatement();

        int i = st.executeUpdate("insert into custinfo(cname ,cemail,cphn,cpass)values('" + first_name + "','" + email + "','" + contact + "','" + pass + "')");
        if(i==1){
        %>
        <script type="text/javascript">
            alert("You have successfully Registered!!");        
            window.location.href="login.html"
        </script>
    
        
        <%
            }
else{
out.print("Rgistration Failed");
}
st.close();
conn.close();
    } catch (Exception e) {
        out.print("Something went Wrong");
        e.printStackTrace();
    }

%>
    </body>
</html>
