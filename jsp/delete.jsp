<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<%
	if (session.getAttribute("admin") == null) {
		session.setAttribute( "status", "Invalid session, please login again.");
		response.sendRedirect("index.jsp");
	}
%>
<jsp:include page="header.jsp" />
<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>
<jsp:useBean id="shop" class="com.DownloadThis.Shop" />

<div class="page">

<%
	int product_id = Integer.parseInt(request.getParameter("id"));

	if (shop.deleteProduct(dbconnection.getConnection(), product_id)) 
		out.print("<h2>Product successfully deleted</h2>");	
	else 
		out.print("<h2>Product was not deleted</h2>");
%>

<FORM METHOD="post" ACTION="list.jsp">
<INPUT TYPE="submit" VALUE="Back to products list">
</FORM>

<!-- end .page --></div>

<jsp:include page="footer.jsp"/>