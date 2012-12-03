<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<%
	if (session.getAttribute("admin") == null && session.getAttribute("user") == null) {
		session.setAttribute( "status", "Invalid session, please login again.");
		response.sendRedirect("index.jsp");
	}
%>
<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>
<jsp:include page="header.jsp"/>

<%
  Connection conn = dbconnection.getConnection();
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery("select * from downloadthis_products order by id ASC");
%>

<div class="navbar">
  <ul class="nav">
    <li><a href="list.jsp">Home</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a href="cart.jsp">Shopping Cart</a></li>
    <li><a href="logout.jsp">Logout</a></li>
  </ul>
  <div class="navbardivider">
  <!-- end .navbardivider --></div>
  <a class="twitter-timeline" href="https://twitter.com/DownloadThisMU" data-widget-id="266002230497378304">Tweets by @DownloadThisMU</a>
  <script>
	!function(d,s,id){
		var js,fjs=d.getElementsByTagName(s)[0];
		if(!d.getElementById(id)){
			js=d.createElement(s);
			js.id=id;
			js.src="//platform.twitter.com/widgets.js";
			fjs.parentNode.insertBefore(js,fjs);
		}
	}
	(document,"script","twitter-wjs");
</script>
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
<%
	if (session.getAttribute("admin") != null) {
%>
		<FORM NAME="addProduct" ACTION="add.jsp">
  		<INPUT TYPE="submit" VALUE="Add product">
  		</FORM>
<%
	}
%>	

  <table border= "1">
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
  <th> View </th>
  <th> Buy </th>
<%
	if (session.getAttribute("admin") != null) {
		out.print("<th> Edit </th>");
		out.print("<th> Delete </th>");
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
    out.print("<td> <img height=150 width=150 src=./images/"+rs.getString("albumart")+" /></td>");
    out.print("<td> <a href=view.jsp?id=" + rs.getInt("id") + "> View </a></td>");
    out.print("<td> <a href=cart.jsp?action=add&id=" + rs.getInt("id") + "> Add to Cart </a></td>");
%>
<%
    if (session.getAttribute("admin") != null) {
    	out.print("<td> <a href=edit.jsp?id=" + rs.getInt("id") + "> Edit </a></td>");
    	out.print("<td> <a href=delete.jsp?id=" + rs.getInt("id"));
%>
    onclick="return confirm('Do you really want to delete?')"> Delete </a></td>
<%
    }
%>
    </tr>
<%
  }
%>
  </table>
<!-- end .content --></div>

<jsp:include page="footer.jsp"/>