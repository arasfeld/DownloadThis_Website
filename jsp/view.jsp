<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<%
	if (session.getAttribute("user") == null && session.getAttribute("admin") == null) {
		session.setAttribute( "status", "Invalid session, please login again.");
		response.sendRedirect("index.jsp");
	}
%>
<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>
<jsp:include page="header.jsp"/>

<%
    String product_id=request.getParameter("id");
    Connection conn = dbconnection.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from downloadthis_products where id ='"+product_id+"'");
%>

<div class="navbar">
  <ul class="nav">
    <li><a href="list.jsp">Home</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a href="cart.jsp">Shopping Cart</a></li>
    <li><a href="logout.jsp">Logout</a></li>
  </ul>
<!-- end .navbar --></div>

<div class="content">
<%
	if (session.getAttribute("admin") != null) {
		out.print("Welcome, " + session.getAttribute("admin") + ".");
	}
	else if (session.getAttribute("user") != null) {
		out.print("Welcome, " + session.getAttribute("user") + ".");
	}
%>
<br/>
  <table border="1">
<%
    ResultSetMetaData resMetaData = rs.getMetaData();
    int nCols = resMetaData.getColumnCount();
%>
  <tr>
<%
    for (int kCol = 1; kCol <= nCols; kCol++) {
      out.print("<th><b>" + resMetaData.getColumnName(kCol) + "</b></th>");
    }
%>
  </tr>
<%
    while (rs.next()) {
%>
      <tr>
<%
      out.print("<td>" + rs.getInt("id") + "</td>");
      out.print("<td>" + rs.getString("artist") + "</td>");
      out.print("<td>" + rs.getString("album") + "</td>");
      out.print("<td>" + rs.getInt("year") + "</td>");
      out.print("<td>" + rs.getString("genre") + "</td>");
      out.print("<td>$" + rs.getFloat("price") + "</td>");
      out.print("<td> <img src=./images/" + rs.getString("albumart") + " /> </td>");
%>
      </tr>
<%
    }
%>
  </table>

<FORM METHOD="post" ACTION="list.jsp">
<INPUT TYPE="submit" VALUE="Back to products list">
</FORM>

<!-- end .content --></div>

<jsp:include page="footer.jsp"/>