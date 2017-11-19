<%@page import="com.secure.kk.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String name = "Cloud";
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");
    String skey = request.getParameter("skey");
    String cname = request.getParameter("saction");
    System.out.println("The Checking Value is " + cname);
   if(cname.equals("owner")){
	   try {
                con = Dbconnection.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from reg where Email='" + user + "' AND Pass='" + pass + "' AND skey='" + skey + "' AND role='Owner'");
                if (rs.next()) {
                    if (user.equals(rs.getString("Email")) && pass.equals(rs.getString("Pass"))) {
                        String a = rs.getString("Email");
                        System.out.println("The Value is " + a);
                        response.sendRedirect("owner.jsp?msg=success");
                        session.setAttribute("email", rs.getString("Email"));
                        session.setAttribute("name", rs.getString("Name"));
                    }
                } else {
                    response.sendRedirect("index.jsp?omsg=success");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
   }else if(cname.equals("user")){
            try {
                con = Dbconnection.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from reg where Email='" + user + "' AND Pass='" + pass + "' AND skey='" + skey + "' AND role='User'");
                if (rs.next()) {
                    response.sendRedirect("user.jsp?msg=success");
                    session.setAttribute("umail", rs.getString("Email"));
                    session.setAttribute("uname", rs.getString("Name"));
                } else {
                    response.sendRedirect("index.jsp?umsg=success");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }}
            else{ 
            try {
                if (user.equalsIgnoreCase(name) && pass.equalsIgnoreCase(name)) {
                    response.sendRedirect("chome.jsp?msg=success");
                } else {
                    response.sendRedirect("index.jsp?msgg=failed");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
    }%>