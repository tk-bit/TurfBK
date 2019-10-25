<%-- 
    Document   : page2action
    Created on : 24 Jul, 2019, 3:43:18 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Booking</title>
        <link rel="stylesheet" href="main_style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style type="text/css">
            .t {
                position: relative;
                top:50%;
                left:50%;
                width: 570px;
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

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
                String s = request.getParameter("getdate");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date start = sdf.parse(s);
                java.sql.Date sqlDate = new java.sql.Date(start.getTime());
                PreparedStatement ps = con.prepareStatement("select sid,slots from slot where sid in(select sid from slot where sid not in(select sid from allotedDetails where aid IN(select aid from alloted where adate=? and turfid=?)))");
                ps.setDate(1, sqlDate);
                String turfm = session.getAttribute("tfid").toString();
                int p = Integer.parseInt(turfm);
                ps.setInt(2, p);
                ResultSet r = ps.executeQuery();

                int ns = Integer.parseInt(request.getParameter("no_of_slots"));
        %>  
        <div class="t">
        <form name="myform" action="newjsp.jsp" method="post" style="font-size:20px;" >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Turf Name : <input type="text" name="turfnam" value="<%=session.getAttribute("tfname")%>" size="9" disabled="disabled" style="position:relative;font-size:45px;text-align:center;margin-left:20px;"/>
            <br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Price (1HR) :<input type="text" name="turfpric" value="<%=session.getAttribute("tfprice")%>" size="6" disabled="disabled" style="position:relative;font-size: 35px;text-align:center;margin-left:17px;"/>
            <br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            No of slots :
            <input type="text" name="no_of_slot" value="<%=request.getParameter("no_of_slots")%>" disabled="disabled" size="5" style="font-size:26px;text-align:center;position:relative;margin-left:20px;"/>
            <br><br><%session.setAttribute("noslot", request.getParameter("no_of_slots"));%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Selected Date:  <input type="date"  name="getdat" value="<%=request.getParameter("getdate")%>" disabled="disabled" style="margin-left:5px;font-size: 26px"/>
            <br><br><%session.setAttribute("gdate", request.getParameter("getdate"));%>
            <input type="hidden" name="hit" id="hit" value="" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Select available slot on this date :
            <select name="timeslots" id="selectslot" onChange="taher(this);" style="margin-left:20px;font-size:16px">
                <option selected="true" disabled="true">**Select**</option>
                <%  while (r.next()) {%>
                <option value='<%=r.getInt("sid")%>'><%=r.getString("slots")%></option>
                <%  }%>
            </select>
            <p id="a"></p>

            <%  for (int i = 0; i <= ns - 1; i++) {%>
            <input type="text" name="nm<%=i%>" id="id<%=i%>" value="" readonly="readonly" style="margin-left:10px;position:relative" />
            <%  }%>

            <input type="submit" id="s2" onclick="return validateFunc()" formtarget="_blank" style="margin-left:20px;position:relative;" value="Confirm Booking" /><BR><BR>
        </form>
        </div>


        <script type="text/javascript">
            var tk = [];
            var zp = [];
            function taher(fast) {
                var cought = document.getElementById("selectslot").value;
                if (tk.length ===<%=(ns - 1)%>) {
                    document.getElementById("selectslot").disabled = true;
                    tk.push(cought);
                } else {
                    tk.push(cought);
                }
                document.getElementById("hit").value = tk;
                zp.push(fast.options[fast.selectedIndex].text);
                for (var i = 0; i < zp.length; i++)
                {
                    document.getElementById("id" + i).value = zp[i];
                }
            }

            function validateFunc() {
                if (document.getElementById("selectslot").disabled === false) {
                    alert("please select required slots");
                    return false;
                }
            }
        </script>
        <%} else {
                response.sendRedirect("login.html");
            }
        %>
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
