<%-- 
    Document   : adminpg
    Created on : 18 Jul, 5019, 10:16:43 PM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            body{
                background-image:url("images/nice -back.jpg");		
                background-position: bottom;
                background-attachment:fixed;
                background-repeat:no-repeat;
                background-size:cover;
                font-family:Century;
            }
            .t {
                position: absolute;
                top:45%;
                left:43%;
                transform:translate(-50%,-50%);
                padding:27px;
                background: rgba(0,0,0,.35);
                color: seashell;
                border-radius: 23%;
                box-sizing: border-box;
                box-shadow: 10px 15px 25px rgba(0,0,0,.5);
            }
            .tk { 
                position: absolute;
                top:45%;
                left:73%;
                transform:translate(-50%,-50%);
                padding:20px;
                background: rgba(0,0,0,.35);
                color:white;
                border-radius: 12%;
                box-sizing: border-box;
                box-shadow: 10px 15px 25px rgba(0,0,0,.5);
            }
        </style>
        <title>Admin Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Hello Admin</h1>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.Date"%>
        <%
            if(session.getAttribute("sadmin")!=null)
            {  
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");                
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select turfid,tname from turf");
        %>
        <h2 style="color: white;position:fixed;left:34%;top:12%">Select your Turf  ~ </h2>
        <form action="admin.jsp">
            <select name="turfid" id="filter" onchange="this.form.submit()" style="font-size:18px;margin-left:50px;position:fixed;left:50%;top:16%;">
                <option selected="true" disabled="true">**Select**</option>
            <%  while(rs.next()){ %>
                <option value='<%=rs.getInt("turfid")%>'><%=rs.getInt("turfid")%>, <%=rs.getString("tname")%></option>
            <%  }%>
        </select>
        <br><br>
        </form>
        <div style="position:fixed;left:9%;top:16%;font-size:23px;color: gainsboro">
        <b>You have selected Turf Id</b>
        <b id="trf"></b>
        </div>
        <script type="text/javascript">
            document.getElementById("trf").innerHTML=<%=session.getAttribute("filterid")%>
        </script>
        
        <!-- Actions of ADMINpg2 -->
        
        <%
            if(session.getAttribute("filterid")!=null){
            try{     
        %>
               
            <table border="4" class="t" cellpadding="2" cellspacing="3"  style="text-align:center;">
                <tr>
                    <!--<th>Alloted id</th>-->
                    <th>Cust id</th>
                    <th>Cust name</th>
                    <th>Alloted date</th>
                    <th>no of slots</th>
                    <th>total Amt</th>
                </tr>
                <%
                        //String t=request.getParameter("filter");
                        String t = "";
                        t = session.getAttribute("filterid").toString();
                        int tk = Integer.parseInt(t);
                        String sql = "select c.cname,a.* from alloted a join custinfo c using(cid) where adate>=now() and turfid=" + tk;
                        Statement stm = con.createStatement();
                        ResultSet r = stm.executeQuery(sql);
                        if(r.next()){
                        do{
                            int k=r.getInt(2);
                            //out.println("<tr><td><a href=admin.jsp?aid=" + k + ">" + k + "</a></td>");
                            out.println("<tr><td>" + r.getInt(3) + "</td>");
                            out.println("<td>" + r.getString(1) + "</td>");
                            out.println("<td>" + r.getString(5) + "</td>");
                            out.println("<td><a style='color: seashell' href=admin.jsp?aid=" + k + ">" + r.getInt(6) + "</a></td>");
                            Statement stm1 = con.createStatement();
                            ResultSet rt = stm1.executeQuery("select amt from bill where aid="+k);
                            rt.next();
                            out.println("<td>" + rt.getInt("amt") + "</td></tr>");
                        }while (r.next());
                        }else{
                            out.println("<tr><td colspan='6'>Sorry! No Bookings to show for Today and in future</td></tr>");
                        }
                        stm.close();
                    } catch (Exception e) {
                        out.println(e);
                    }
            }
                %>
                </table>
            <br><br><br>
        
                <%
                    try {
                        if (session.getAttribute("mykey") != null) {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
                            String nslot = session.getAttribute("mykey").toString();
                            int aid = Integer.parseInt(nslot);
                            String sql = "select slots from slot where sid IN (select sid from alloteddetails where aid=" + aid + ")";
                            Statement stm = con.createStatement();
                            ResultSet r = stm.executeQuery(sql);
                            out.println("<table class='tk' border='2' style='text-align:center'><tr><th colspan='3'>booked slots</th></tr>");
                            while (r.next()) {
                                out.println("<tr><td>" + r.getString("slots") + "</td>");
                            }
                            out.println("</table>");
                            stm.close();
                            con.close();
                        }
                    } catch (Exception e) {
                        out.println(e);
                    } finally {
                        session.removeAttribute("mykey");
                        //session.removeAttribute("filterid");
                    }

                }
else{
response.sendRedirect("login.html");
}
                %>
        
                <b style="position:fixed;top:15%;left:77%">ADD A NEW TURF </b><br>
                <a onclick='javascript:window.open("addtrf.html", "_blank", "scrollbars=1,resizable=10,height=413,width=418");' style="position:fixed;top:20%;left:80%"><button>Add Turf</button></a>
            
                <b style="position:fixed;top:23%;left:12%;color: beige">Delete this  TURF </b><br>
                <a onclick='javascript:window.open("delete.html", "_blank", "scrollbars=1,resizable=10,height=340,width=380");' style="position:fixed;top:28%;left:15%"><button>Delete It</button></a>

    </body>
</html>