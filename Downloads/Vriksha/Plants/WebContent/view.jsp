<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%
    Blob image = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;
    Connection con = null;
    String pid = request.getParameter("id");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hangingplantsdata", "root", "1234");
        String query = "SELECT image FROM plants WHERE pid = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, pid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                image = rs.getBlob(1);
                imgData = image.getBytes(1, (int) image.length());
            } else {
                out.println("Image not found");
                return;
            }
        }
        response.setContentType("image/jpeg");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable to display image: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
