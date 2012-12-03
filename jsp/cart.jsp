<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
	if (session.getAttribute("user") == null && session.getAttribute("admin") == null) {
		session.setAttribute( "status", "Invalid session, please login again.");
		response.sendRedirect("index.jsp");
	}
%>
<jsp:include page="header.jsp" />
<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session" />
<jsp:useBean id="cart" class="com.DownloadThis.Cart" scope="session" />
<jsp:useBean id="shop" class="com.DownloadThis.Shop" />
<jsp:useBean id="product" class="com.DownloadThis.Product" />
<%
	if (request.getParameter("id") != null && request.getParameter("action").equals("add")) {
		int product_id = Integer.parseInt(request.getParameter("id"));
		if (shop.isValidProductId(product_id))
			cart.add(product_id);
		else
			session.setAttribute("error","Invalid product id, nothing added to the cart.");
	}
	if (request.getParameter("id") != null && request.getParameter("action").equals("delete")) {
		int product_id = Integer.parseInt(request.getParameter("id"));
		if (shop.isValidProductId(product_id))
			cart.remove(product_id);
		else
			session.setAttribute("error","Invalid product id, nothing removed from the cart.");
	}
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
	if (session.getAttribute("user") != null) {
		out.print("Welcome, " + session.getAttribute("user") + ".");
	}
	else if (session.getAttribute("admin") != null) {
		out.print("Welcome, " + session.getAttribute("admin") + ".");
	}
%>
<br/>
  <h2> Items in cart</h2>
    <table border= "1">
	<tr>
	  <td> Product ID </td>
	  <td> Artist </td>
 	  <td> Album </td>
	  <td> Price </td>
	  <td> Action </td>
	</tr>
	<%
		ListIterator<Integer> listIterator = cart.view().listIterator();
		float total = 0.0f;
		while (listIterator.hasNext()) {
			int value = listIterator.next();
			product = shop.getProductById(dbconnection.getConnection(),value);
			total += product.getPrice();
			session.setAttribute("total", total);
			out.print("<tr>");
			out.print("<td> <a href= view.jsp?id=" + value + "> " + value + "</a> </td>");
			out.print("<td>" + product.getArtist() + "</td>");
			out.print("<td>" + product.getAlbum() + "</td>");
			out.print("<td>$" + product.getPrice() + "</td>");
			out.print("<td> <a href= cart.jsp?action=delete&id=" + value + "> Delete item </a> </td></tr>");
	  	}
			out.print("<tr></tr><tr><td colspan=3></td><td>Total</td><td>$" + total + "</td></tr>");
	%>
    </table>
    <table>
	<tr>
	  <td>
	   <FORM METHOD="post" ACTION="list.jsp">
	   <INPUT TYPE="submit" VALUE="Continue shopping">
	   </FORM>
	  </td>
	  <td>
	   <FORM METHOD="post" ACTION="checkout.jsp">
	   <INPUT TYPE="submit" VALUE="Checkout">
	   </FORM></td>
	</tr>
    </table>

<!-- end .content --></div>
	
<jsp:include page="footer.jsp" />