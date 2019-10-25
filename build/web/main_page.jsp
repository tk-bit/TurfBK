<%-- 
    Document   : main_page
    Created on : 16 Jul, 2019, 8:19:41 PM
    Author     : Admin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Sportz Buddy</title>
<link href="main_style.css" rel="stylesheet" type="text/css" media="screen" />
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
    <div id="wrapper">
        <div id="menu-wrapper">
            <div id="menu" class="container">
                <ul>
                    <li><a href="main_page.jsp">Home</a></li>
                    <li><a href="#about">About Us</a></li>
                        <%
                            if ((session.getAttribute("suid") == null) || (session.getAttribute("suid") == "")) {
                        %>
                    <li><a href="login.html">LOGIN / Register</a></li>
                        <%} else {%>
                    <li><a href="bill.jsp">View Bill</a></li>
                    <li style="position:relative;left:28%"><p style="font-variant:small-caps;text-transform:capitalize;font-weight:bolder; font-family:Bookman Old Style; color:yellow;font-size:16px;">Hello <%=session.getAttribute("suser")%></p></li>
                    <li style="position:relative;left:26.5%" class="current_page_item"><a href="logout.jsp">LOG-OUT</a></li>
                        <%}%>
                </ul>
            </div>
        </div>

        <div style="background-color: lightyellow">  <center><b style="color: green; font-family:cursive;font-style: oblique;font-size: 25px;">Start Turfing !!</b></center></div>

        <div class="back">
            <div id="logo" class="container">
                <h2>Sportz Buddy</h2>
            </div>

            <div id="three-column" class="container">
                <div id="tbox1">
                    <div class="box-style box-style01">
                        <div class="content">
                            <div class="image">
                                <a href="page2.jsp?field=1"><img src="images/mira.jpg" width="324" height="200" /></a>
                            </div>
                            <h2>SHORT Pitch </h2>
                            <p> Its <b id="loc">5 a side</b> turf.
                                Has Flood Lights.
                                Situated in <b id="loc">Bhayender (w) Maxus.</b>
                                Click image to book this turf. 
                                </p>
                        </div>
                    </div>
                </div>
                <div id="tbox2">
                    <div class="box-style box-style02">
                        <div class="content">
                            <div class="image">
                                <a href="page2.jsp?field=2"><img src="images/mira1.jpg" width="324" height="200" /></a>
                            </div>
                            <h2>Trick Shot </h2>
                            <p>Its <b id="loc">11 a side</b> turf.
                                Has Flood Lights. Location <b id="loc">Bhayender sv road.</b>
                                Click image to book this turf. 
                            </p>
                            
                        </div>
                    </div>
                </div>
                <div id="tbox3">
                    <div class="box-style box-style03">
                        <div class="content">
                            <div class="image">
                                <a href="page2.jsp?field=3"><img src="images/trick1.jpg" width="324" height="200" /></a>
                            </div>
                            <h2>PG-Vora </h2>
                            <p> Its <b id="loc">9 a side</b> turf.
                                Has Flood Lights.
                                Situated in <b id="loc">Mira_Road (E).</b>
                                Click on image to book this turf. 
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p style="position:relative;left:3%">*Note : Capacity is displayed for one side of turf </p>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select turfid,tname,tcap,location from turf where turfid not in(1,2,3)");
        %>
        <h2 style="position:relative;left:28%">Other Available Turfs  ~ </h2><br>
            <h4 style="position:relative;left:40%;font-size:20px">turf name | capacity | location</h4>
            <form method="post" action="page2.jsp">
                <select name="field" id="filter" onChange="this.form.submit()" style="position:relative;left:40%;font-size:large">
                    <option selected="true" disabled="true">**SELECT**</option>
                    <%  while (rs.next()) {%>
                    <option value='<%=rs.getInt("turfid")%>'> <%=rs.getString("tname")%>, <%=rs.getInt("tcap")%>, <%=rs.getString("location")%></option>
                    <%  }%>
                </select>
                <br><br>
            </form>
    </div>
                                        
        <section id="about"></section>
<div id="footer-bg">
	<div id="footer-content" class="container">
		<div id="column1">
                    <h2>About</h2>
                    <ul class="list-style2"><li><a href="#">We Build responsive website here for all needs</a></li>
                        <li><a href="#" class=""></a></li>
                        <li><a href="#" class=""></a></li>
                        <li><a href="#" class=""></a></li></ul>
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
<!-- end #footer -->
</body>
</html>