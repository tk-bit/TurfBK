<%-- 
    Document   : logout
    Created on : 17 Jul, 2019, 3:17:57 PM
    Author     : Admin
--%>


<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
<style type="text/stylesheet">
    body{
        background-image:url(images/nice -back.jpg);		
        background-position:center bottom;
        background-attachment:fixed;
        background-repeat:no-repeat;
        background-size:cover;
    }
</style>
</head>
<body>
        <% session.invalidate();%>
        <script type="text/javascript">
            window.alert('You have LOG-OUT succesfully.\nClick OK to load Homepage');
            window.location.replace('main_page.jsp');
                
        </script>
</body>
</html>