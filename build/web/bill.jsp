<%-- 
    Document   : bill
    Created on : 15 Sep, 2019, 1:03:45 PM
    Author     : Admin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="main_style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style type="text/css">
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
                    <li><a href="#">View Bill</a></li>
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
    <center><h4 style="font-size:30px;color: #3B5998">Displaying your Bill(s) for TODAY and in near FUTURE </h4></center>
                    
        <%
            if(session.getAttribute("suid")!=null){
            try{
            int cid=Integer.parseInt(session.getAttribute("suid").toString());
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
            PreparedStatement pst = con.prepareStatement("select * from bill where aid in(select aid from alloted where cid=? and adate>=now())");
            pst.setInt(1, cid);
            ResultSet rs = pst.executeQuery();
            while (rs.next()){
        %>
        <table style="background-color:black;color: white; font-size: 20px" cellspacing="9" cellpadding="6" align="center">
            <thead style="font-family: fantasy">
                <tr colspan="2">
                    <th>Customer Name : <%=session.getAttribute("suser")%></th>
                </tr>
                <tr colspan="2">
                    <th>Customer Id: <%=session.getAttribute("suid")%></th>
                </tr>
                <tr>
                    <td>Bill Date: <%=rs.getDate("bdate")%></td>
                    <td>Bill Id: <%=rs.getInt("billid")%></td>
                </tr>
                <tr>
                    <th>Attribute</th>
                    <th>Values</th>
                </tr>
            </thead>
            <tbody>
                <%
                    PreparedStatement pstm = con.prepareStatement("select t.tname,t.tprice,a.adate,t.turfid from turf t join alloted a using(turfid) where a.cid=? and a.aid="+rs.getInt("aid"));
                    pstm.setInt(1, cid);
                    ResultSet rst = pstm.executeQuery();
                    if(rst.next()){
                    
                %>
                <tr>
                    <td>TURF Name :</td>
                    <td><%=rst.getString(1)%></td>
                </tr>
                <tr>
                    <td>Selected Date :</td>
                    <td><%=rst.getDate(3)%></td>
                </tr>
                <tr>
                    <td>Slots you have Selected :</td>
                    <td>
                    <%
                        PreparedStatement pst1 = con.prepareStatement("select slots from slot where sid IN (select sid from alloteddetails where aid="+rs.getInt("aid")+")");
                        
                        ResultSet rs1 = pst1.executeQuery();
                        while(rs1.next()){     
                    %>
                    <%=rs1.getString(1)%>&nbsp;<% }%></td> 
                </tr>
                <tr>
                    <td>Price per slot :</td>
                    <td><%=rst.getInt(2)%></td> <% }%>
                </tr>
                <tr>
                    <td>Total Amount :</td>
                    <td><%=rs.getInt("amt")%></td>
                </tr>
            </tbody>
        </table>
                <br><br>
        <%
            }
}
catch(Exception e){out.println(e);}
}else{
response.sendRedirect("login.html");
}
        %>
        <section id="about"></section>
<div id="footer-bg">
	<div id="footer-content" class="container">
		<div id="column1">
                    <h2>About</h2>
                    <ul class="list-style2"><li><a href="#">wef</a></li>
                        <li><a href="#" class="">ghjkl</a></li>
                        <li><a href="#" class="">cvbnm</a></li>
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
