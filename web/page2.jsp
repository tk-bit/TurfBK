<%-- 
    Document   : newjsp
    Created on : 10 Jul, 2019, 12:56:29 AM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="main_style.css" type="text/css" media="screen"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style type="text/css">
            .t {
                position: relative;
                top:50%;
                left:50%;
                width: 600px;
                transform:translate(-50%);
                padding:27px;
                background: rgba(0,0,0,.45);
                color: seashell;
                border-radius: 25%;
                box-sizing: border-box;
                box-shadow: 10px 15px 25px rgba(0,0,0,.5);
            }
.fa {
  padding: 20px;
  font-size: 30px;
  width: 30px;
  text-align: center;
  text-decoration: none;
  margin: 5px 2px;
  border-radius: 50%;
}
.fa:hover {
    opacity: 0.5;
}

.fa-facebook {
  background: #3B5998;
  color: white;
}

.fa-twitter {
  background: #55ACEE;
  color: white;
}

.fa-google-plus {
  background:red;
  color: white;
}
.fa-instagram {
  background: brown;
  color: white;
}
    </style>
    </head>
    <body>
        <div id="menu-wrapper">
            <div id="menu" class="container">
                <ul>
                    <li><a href="main_page.jsp">Home</a></li>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="bill.jsp">View Bill</a></li>
                    <li style="position:relative;left:28%"><p style="font-variant:small-caps;text-transform:capitalize;font-weight:bolder; font-family:Bookman Old Style; color:yellow;font-size:16px;">Hello <%=session.getAttribute("suser")%></p></li>
                    <li style="position:relative;left:26.5%" class="current_page_item"><a href="logout.jsp">LOG-OUT</a></li>
                </ul>
            </div>
        </div>
        <div class="backgr">
            <div id="logo" class="container">
                <h2>Sportz Buddy</h2>

            </div>

        </div>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.Date"%>
        <%
            if (session.getAttribute("suid") != null) {
                String t = request.getParameter("field");
                session.setAttribute("tfid", t);
                int td = Integer.parseInt(t);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
                PreparedStatement pst = con.prepareStatement("select tname,tprice,tcap,location from turf where turfid=?");
                pst.setInt(1, td);

                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
        %>
        <div class="t">
        <form action="page2action.jsp" method="post" style="margin-left:20px;font-size:20px;">
            Turf Name :   <input type="text" name="turfname" value="<%=rs.getString("tname")%>" size="9" disabled="disabled" style="position:relative;font-size:45px;margin-left:20px;text-align:center;"/>
            <%session.setAttribute("tfname", rs.getString("tname"));%><br><br>
            Price (1 Hr) :    <input type="text" name="turfprice" value="<%=rs.getString("tprice")%>" size="8" disabled="disabled" style="position:relative;margin-left:10px;font-size:38px;text-align:center;"/>
            <%session.setAttribute("tfprice", rs.getString("tprice"));%><br><br>
            Turf Capacity :   <input type="text" name="turfcap" value="<%=rs.getString("tcap")%> a side" size="6" disabled="disabled" style="position:relative;font-size: 30px;text-align:center;"/><bR><BR>
            Turf Location :   <input type="text" name="turfloc" value="<%=rs.getString("location")%>" size="20" disabled="disabled" style="position:relative;font-size: 20px;text-align:center;"/>
            <% }%>
            <br><br>
            How many slots do you<br> want to book :
            <input type="text" name="no_of_slots" size="15" style="font-size:20px;text-align:center;" placeholder="Input No of Slots"/>
            <br><br>

            Choose Date: <input type="date"  name="getdate" style="margin-left:10px;font-size: 23px"/>
            <input type ="submit" value ="CHECK Available Slots" style="margin-left:20px"/><BR><BR>

        </form></div>
        <%
            } else {
                response.sendRedirect("login.html");
            }%>




        <section id="about"></section>
        <div id="footer-bg">
            <div id="footer-content" class="container">
                <div id="column1">
                    <h2>About</h2>
                    <ul class="list-style2"><li><a href="#">wef</a></li>
                        <li><a href="#" class=""></a></li>
                        <li><a href="#" class=""></a></li>
                        <li><a href="#" class="">sdfghjhgfds</a></li></ul>
                </div>
                <div id="column2">
                    <h2>Contact Us</h2>
                    <a href="https://www.facebook.com/taher.kapasi.14" target="_blank" class="fa fa-facebook"></a>
                    <a href="" class="fa fa-google-plus" target="_blank"></a>
                    <a href="#" class="fa fa-twitter" target="_blank"></a>
                    <a href="https://www.instagram.com/_tk._._" target="_blank" class="fa fa-instagram"></a>
                </div>

            </div>
        </div>
    </body>

</html>