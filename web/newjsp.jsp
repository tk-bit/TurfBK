<%-- 
    Document   : adminpanel
    Created on : 12 Aug, 2019, 6:39:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BILL</title>
    </head>
    <body id="content">
        
        <%
            
        String val=request.getParameter("hit");
        String[] astring=val.split(",");
        int[] aint=new int[astring.length];
        for (int i=0;i<aint.length;i++){
            aint[i]=Integer.parseInt(astring[i]);
            //out.println(aint[i]);
        }
            
        String turfm=session.getAttribute("tfname").toString();
        //out.println(turfm);
        String pr=session.getAttribute("tfprice").toString();
        //out.println(pr);
        int price=Integer.parseInt(pr);
        String dt=session.getAttribute("gdate").toString();
        //out.println(dt);    
        String ns=session.getAttribute("noslot").toString();
        //out.println(ns);
        int no=Integer.parseInt(ns);
        
        int tot=price*no;
        //out.println(tot);
        
        String txt="",comma="";
        for (int i=0;i<=no-1;i++){
            String q="nm"+i;
            if(txt.length()!=0)
                comma=", ";
            txt+=comma+request.getParameter(q);
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
        //inserting into Alloted table
        String cstid=session.getAttribute("suid").toString();
        int csid=Integer.parseInt(cstid);
        String trfid=session.getAttribute("tfid").toString();
        int tfid=Integer.parseInt(trfid);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dat = sdf.parse(dt);
        java.sql.Date sqldt = new java.sql.Date(dat.getTime());
        PreparedStatement ps=con.prepareStatement("insert into alloted (cid,turfid,adate,no_of_slots)values (?,?,?,?)");
        ps.setInt(1, csid);
        ps.setInt(2, tfid);
        ps.setDate(3, sqldt);
        ps.setInt(4, no);
        ps.executeUpdate();
        //out.print(i+" Record Inserted");
        
        //inserting into allotedDetails
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select LAST_INSERT_ID() as aid");
        rs.next();
        int ai=Integer.parseInt(rs.getString("aid"));
        //try{
        for (int j=0;j<=no-1;j++){
            PreparedStatement ps1=con.prepareStatement("insert into allotedDetails(aid,sid) values(?,?)");
            ps1.setInt(1, ai);
            ps1.setInt(2, aint[j]);
            ps1.executeUpdate();
        }
      
        String today=sdf.format(new java.util.Date()).toString();
        Date dat1 = sdf.parse(today);
        java.sql.Date sqldt1 = new java.sql.Date(dat1.getTime());
        PreparedStatement ps2=con.prepareStatement("insert into bill(bdate,aid,amt) values(?,?,?)");
        ps2.setDate(1, sqldt1);
        ps2.setInt(2, ai);
        ps2.setInt(3, tot);
        ps2.executeUpdate();

        Statement stm=con.createStatement();
        ResultSet rst=stm.executeQuery("select LAST_INSERT_ID() as billid");
        rst.next();
        int bi=Integer.parseInt(rst.getString("billid"));
        %>
    <center><h2 style="width: 50%;background-color: #8A8985;font-family: COLONNA MT;color: yellow;-webkit-text-stroke-width:1px;-webkit-text-stroke-color:snow">Sportz Buddy</h2></center>
        <table style="background-color:black;color: white; font-size: 20px" cellspacing="9" cellpadding="6" align="center">
            <thead style="font-family: fantasy">
                <tr colspan="2">
                    <th>Customer Name : <%=session.getAttribute("suser")%></th>
                </tr>
                <tr colspan="2">
                    <th>Customer Id: <%=session.getAttribute("suid")%></th>
                </tr>
                <tr>
                    <td>Bill Date: <%=today%></td>
                    <td>Bill Id: <%=bi%></td>
                </tr>
                <tr>
                    <th>Attribute</th>
                    <th>Values</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>TURF Name :</td>
                    <td><%=turfm%></td>
                </tr>
                <tr>
                    <td>Selected Date :</td>
                    <td><%=dt%></td>
                </tr>
                <tr>
                    <td>Slots you have Selected :</td>
                    <td><%=txt%></td>
                </tr>
                <tr>
                    <td>Price per slot :</td>
                    <td><%=price%></td>
                </tr>
                <tr>
                    <td>Total Amount :</td>
                    <td><%=tot%></td>
                </tr>
            </tbody>
        </table>
                <br>
                <br>
        <button type="button" onclick="prin()" style="position: absolute; left:48%">Print or save to pdf !</button>
<script type="text/javascript">
function prin(){
window.print();
}
</script>
    </body>
</html>
