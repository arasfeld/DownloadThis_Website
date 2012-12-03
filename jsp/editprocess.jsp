<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>
<jsp:include page="header.jsp"/>

<%
    try {
	String artist = request.getParameter("artist");
	String album = request.getParameter("album");
	int year = Integer.parseInt(request.getParameter("year"));
	String genre = request.getParameter("genre");
	float price = Float.parseFloat(request.getParameter("price"));
	String albumart = request.getParameter("albumart");
	int product_id = Integer.parseInt(request.getParameter("id"));

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = dbconnection.getConnection();
	String sql = "UPDATE downloadthis_products SET artist=?,album=?,year=?,genre=?,price=?,albumart=? WHERE id=?";
	PreparedStatement record = conn.prepareStatement(sql);
	record.setString(1,artist);
	record.setString(2,album);
	record.setInt(3,year);
	record.setString(4,genre);
	record.setFloat(5,price);
	record.setString(6,albumart);
	record.setInt(7,product_id);
	record.executeUpdate();
	record.close();
    } catch(Exception e){
	System.out.println("Exception is ;"+e);
    }
%>

<div class="page">

<h2>Product successfully updated</h2>

<FORM METHOD="post" ACTION="list.jsp">
<INPUT TYPE="submit" VALUE="Back to products list">
</FORM>

<!-- end .page --></div>

<jsp:include page="footer.jsp"/>