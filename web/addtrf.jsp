<%-- 
    Document   : test
    Created on : 30 Aug, 2019, 2:46:47 PM
    Author     : Admin
--%>


<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Turf Adding Form </title>
		<link rel="stylesheet" href="styl.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
                <style type="text/css">
            body{
                background-image:url("images/nice -back.jpg");		
                background-position: bottom;
                background-attachment:fixed;
                background-repeat:no-repeat;
                background-size:cover;
                font-family:Century;
            }
        </style>
	</head>
	<body>
        <%
            String first_name = request.getParameter("tname");
            String contact = request.getParameter("user");
            String email = request.getParameter("cap");
            String pass = request.getParameter("price");
            try
{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
        PreparedStatement st = conn.prepareStatement("insert into turf(tname,tprice,tcap) values(?,?,?)");
        st.setString(1, first_name);
        st.setInt(2, Integer.parseInt(pass));
        st.setInt(3, Integer.parseInt(email));
        int i = st.executeUpdate();
        if(i==1){
        %>
        <script type="text/javascript">
            alert("You have successfully Added new Turf!!");        
            //window.close();
        </script>
    
        
        <%
            }
else{
out.print(" Failed");
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