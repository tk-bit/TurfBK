package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class main_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<meta name=\"keywords\" content=\"\" />\n");
      out.write("<meta name=\"description\" content=\"\" />\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<title>Sportz Buddy</title>\n");
      out.write("<link href=\"main_style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    <style type=\"text/css\">\n");
      out.write(".fa {\n");
      out.write("  padding: 20px;\n");
      out.write("  font-size: 30px;\n");
      out.write("  width: 30px;\n");
      out.write("  text-align: center;\n");
      out.write("  text-decoration: none;\n");
      out.write("  margin: 5px 2px;\n");
      out.write("  border-radius: 50%;\n");
      out.write("}\n");
      out.write(".fa:hover {\n");
      out.write("    opacity: 0.5;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".fa-facebook {\n");
      out.write("  background: #3B5998;\n");
      out.write("  color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".fa-twitter {\n");
      out.write("  background: #55ACEE;\n");
      out.write("  color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".fa-google-plus {\n");
      out.write("  background:red;\n");
      out.write("  color: white;\n");
      out.write("}\n");
      out.write(".fa-instagram {\n");
      out.write("  background: brown;\n");
      out.write("  color: white;\n");
      out.write("}\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div id=\"wrapper\">\n");
      out.write("        <div id=\"menu-wrapper\">\n");
      out.write("            <div id=\"menu\" class=\"container\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"main_page.jsp\">Home</a></li>\n");
      out.write("                    <li><a href=\"#about\">About Us</a></li>\n");
      out.write("                        ");

                            if ((session.getAttribute("suid") == null) || (session.getAttribute("suid") == "")) {
                        
      out.write("\n");
      out.write("                    <li><a href=\"login.html\">LOGIN / Register</a></li>\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                    <li><a href=\"bill.jsp\">View Bill</a></li>\n");
      out.write("                    <li style=\"position:relative;left:28%\"><p style=\"font-variant:small-caps;text-transform:capitalize;font-weight:bolder; font-family:Bookman Old Style; color:yellow;font-size:16px;\">Hello ");
      out.print(session.getAttribute("suser"));
      out.write("</p></li>\n");
      out.write("                    <li style=\"position:relative;left:26.5%\" class=\"current_page_item\"><a href=\"logout.jsp\">LOG-OUT</a></li>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div style=\"background-color: lightyellow\">  <center><b style=\"color: green; font-family:cursive;font-style: oblique;font-size: 25px;\">Start Turfing !!</b></center></div>\n");
      out.write("\n");
      out.write("        <div class=\"back\">\n");
      out.write("            <div id=\"logo\" class=\"container\">\n");
      out.write("                <h2>Sportz Buddy</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"three-column\" class=\"container\">\n");
      out.write("                <div id=\"tbox1\">\n");
      out.write("                    <div class=\"box-style box-style01\">\n");
      out.write("                        <div class=\"content\">\n");
      out.write("                            <div class=\"image\">\n");
      out.write("                                <a href=\"page2.jsp?field=1\"><img src=\"images/mira.jpg\" width=\"324\" height=\"200\" /></a>\n");
      out.write("                            </div>\n");
      out.write("                            <h2>SHORT Pitch </h2>\n");
      out.write("                            <p> Its <b id=\"loc\">5 a side</b> turf.\n");
      out.write("                                Has Flood Lights.\n");
      out.write("                                Situated in <b id=\"loc\">Bhayender (w) Maxus.</b>\n");
      out.write("                                Click image to book this turf. \n");
      out.write("                                </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"tbox2\">\n");
      out.write("                    <div class=\"box-style box-style02\">\n");
      out.write("                        <div class=\"content\">\n");
      out.write("                            <div class=\"image\">\n");
      out.write("                                <a href=\"page2.jsp?field=2\"><img src=\"images/mira1.jpg\" width=\"324\" height=\"200\" /></a>\n");
      out.write("                            </div>\n");
      out.write("                            <h2>Trick Shot </h2>\n");
      out.write("                            <p>Its <b id=\"loc\">11 a side</b> turf.\n");
      out.write("                                Has Flood Lights. Location <b id=\"loc\">Bhayender sv road.</b>\n");
      out.write("                                Click image to book this turf. \n");
      out.write("                            </p>\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"tbox3\">\n");
      out.write("                    <div class=\"box-style box-style03\">\n");
      out.write("                        <div class=\"content\">\n");
      out.write("                            <div class=\"image\">\n");
      out.write("                                <a href=\"page2.jsp?field=3\"><img src=\"images/trick1.jpg\" width=\"324\" height=\"200\" /></a>\n");
      out.write("                            </div>\n");
      out.write("                            <h2>PG-Vora </h2>\n");
      out.write("                            <p> Its <b id=\"loc\">9 a side</b> turf.\n");
      out.write("                                Has Flood Lights.\n");
      out.write("                                Situated in <b id=\"loc\">Mira_Road (E).</b>\n");
      out.write("                                Click on image to book this turf. \n");
      out.write("                                </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <p style=\"position:relative;left:3%\">*Note : Capacity is displayed for one side of turf </p>\n");
      out.write("        ");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_d", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select turfid,tname,tcap,location from turf where turfid not in(1,2,3)");
        
      out.write("\n");
      out.write("        <h2 style=\"position:relative;left:28%\">Other Available Turfs  ~ </h2><br>\n");
      out.write("            <h4 style=\"position:relative;left:40%;font-size:20px\">turf name | capacity | location</h4>\n");
      out.write("            <form method=\"post\" action=\"page2.jsp\">\n");
      out.write("                <select name=\"field\" id=\"filter\" onChange=\"this.form.submit()\" style=\"position:relative;left:40%;font-size:large\">\n");
      out.write("                    <option selected=\"true\" disabled=\"true\">**SELECT**</option>\n");
      out.write("                    ");
  while (rs.next()) {
      out.write("\n");
      out.write("                    <option value='");
      out.print(rs.getInt("turfid"));
      out.write("'> ");
      out.print(rs.getString("tname"));
      out.write(',');
      out.write(' ');
      out.print(rs.getInt("tcap"));
      out.write(',');
      out.write(' ');
      out.print(rs.getString("location"));
      out.write("</option>\n");
      out.write("                    ");
  }
      out.write("\n");
      out.write("                </select>\n");
      out.write("                <br><br>\n");
      out.write("            </form>\n");
      out.write("    </div>\n");
      out.write("                                        \n");
      out.write("        <section id=\"about\"></section>\n");
      out.write("<div id=\"footer-bg\">\n");
      out.write("\t<div id=\"footer-content\" class=\"container\">\n");
      out.write("\t\t<div id=\"column1\">\n");
      out.write("                    <h2>About</h2>\n");
      out.write("                    <ul class=\"list-style2\"><li><a href=\"#\">We Build responsive website here for all needs</a></li>\n");
      out.write("                        <li><a href=\"#\" class=\"\"></a></li>\n");
      out.write("                        <li><a href=\"#\" class=\"\"></a></li>\n");
      out.write("                        <li><a href=\"#\" class=\"\"></a></li></ul>\n");
      out.write("\t\t</div>\n");
      out.write("                <div id=\"column2\">\n");
      out.write("                    <h2>Contact Us</h2>\n");
      out.write("                    <a href=\"https://www.facebook.com/taher.kapasi.14\" target=\"_blank\" class=\"fa fa-facebook\"></a>\n");
      out.write("                    <a href=\"\" class=\"fa fa-google-plus\" target=\"_blank\"></a>\n");
      out.write("                    <a href=\"#\" class=\"fa fa-twitter\" target=\"_blank\"></a>\n");
      out.write("                    <a href=\"https://www.instagram.com/_tk._._\" target=\"_blank\" class=\"fa fa-instagram\"></a>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("<!-- end #footer -->\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
