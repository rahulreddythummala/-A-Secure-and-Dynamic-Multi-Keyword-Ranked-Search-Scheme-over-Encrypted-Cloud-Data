<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String fname = session.getAttribute("fname").toString();
    String owner = session.getAttribute("owner").toString();
<%@page import="com.secure.kk.action.Dbconnection"%>
    String uname = session.getAttribute("umail").toString();
    String dkey = request.getParameter("dkey");
    try {
        con = Dbconnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from request where fname='" + fname + "' AND uname='" + uname + "' AND owner='" + owner + "' AND dkey='" + dkey + "'");
        if (rs.next()) {
            response.sendRedirect("download?" + fname + "," + owner);
        } else {
            response.sendRedirect("user.jsp?dmsg=success");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>