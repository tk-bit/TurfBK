<%-- 
    Document   : login
    Created on : 10 Jul, 2019, 3:21:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <title>Login Form </title>
        <link rel="stylesheet" href="styl.css">
        <style>
                .alert-warning{
                    padding-top:8%;
                    color: green;
                    font-family: monospace;
                    font-size: 25px;
                }
            </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
<%@page import="java.sql.*,java.util.*"%>
<%
 try{
String userid=request.getParameter("user"); 
String password=request.getParameter("pass"); 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d","root","root");
PreparedStatement pst = con.prepareStatement("Select cid,cname from custinfo where cemail=? and cpass=?");
        pst.setString(1, userid);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery(); 
        
        if(rs.next()){
            session.setAttribute("suser", rs.getString("cname"));
            session.setAttribute("suid", rs.getString("cid"));
            out.println(session.getAttribute("suid").toString());
            
            response.sendRedirect("main_page.jsp");
           
        }
        if(userid.equals("admin@my.com")&&password.equals("admin")){
            session.setAttribute("sadmin", "admin");
            response.sendRedirect("adminpg.jsp");
            
        }
        else
        {
%>
    <center> <div class="alert-warning">
            <strong>INVALID LOGIN</strong> data <a href="login.html">Try again.</a>
        </div>  </center>
<%
            }


}
   catch(Exception e){       
       out.println("<center><table style='padding: 200px 200px;'><tr><td style='color:green;'>Something went wrong !! Please try again </td></tr></table></center>");       
   }
    finally {
        
    }
%>


    </body>
</html>
