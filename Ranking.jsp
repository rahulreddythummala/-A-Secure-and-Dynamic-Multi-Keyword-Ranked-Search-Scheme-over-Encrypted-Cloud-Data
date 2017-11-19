<%@page import="com.secure.kk.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    int i = 0;
    String nrank = null;
    String[] data = request.getQueryString().split(",");
    System.out.println("The uname " + data[0]);
    System.out.println("The fname " + data[1]);
    System.out.println("The keyword " + data[2]);
    System.out.println("The Owner " + data[3]);
    try {
        con = Dbconnection.getConnection();
        st = con.createStatement();
        st1 = con.createStatement();
        rs = st.executeQuery("select * from files where keyword='" + data[2] + "' AND filename='" + data[1] + "' AND owner='" + data[3] + "'");
        if (rs.next()) {
            i = Integer.parseInt(rs.getString("frank"));
            st.executeUpdate("insert into request(fname, keyword, uname, owner, status,dkey)values('" + data[1] + "','" + data[2] + "','" + data[0] + "','" + data[3] + "','Waiting','00000')");
        }
        i = i + 1;
        nrank = String.valueOf(i);
        System.out.println("Rank is "+nrank);
        int j = st1.executeUpdate("update files set frank='" + nrank + "' where keyword='" + data[2] + "' AND filename='" + data[1] + "' AND owner='" + data[3] + "' ");
        if (j != 0) {
            System.out.println("Success");
            response.sendRedirect("user.jsp?rmsg=success");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }%>