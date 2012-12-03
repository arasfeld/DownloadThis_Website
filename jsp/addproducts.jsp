<%
	if (session.getAttribute("admin") == null) {
		session.setAttribute( "status", "Invalid session, please login again.");
		response.sendRedirect("index.jsp");
	}
%>
<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>
<jsp:useBean id="product" class="com.DownloadThis.Product"/>
<jsp:useBean id="shop" class="com.DownloadThis.Shop"/>
<jsp:setProperty name="product" property="*"/>
<jsp:include page="header.jsp"/>

<div class="page">

<%
	if (shop.addProduct(dbconnection.getConnection(), product)) {
%>


<h2>Product successfully added</h2>
<table border="1">
 
 <tr>
   <td class="label">Artist:</td> <td><jsp:getProperty name="product" property="artist"/></td>
 </tr>
 <tr>
   <td class-"label">Album:</td> <td><jsp:getProperty name="product" property="album"/></td>
 </tr>
 <tr>
   <td class="label">Year:</td> <td><jsp:getProperty name="product" property="year"/></td>
 </tr>
 <tr>
   <td class="label">Genre:</td> <td><jsp:getProperty name="product" property="genre"/></td>
 </tr>
 <tr>
   <td class="label">Price:</td> <td> <fmt:formatNumber value="${product.price}" type="currency"/></td>
 </tr>
 <tr>
   <td class="label">Filename:</td> <td><jsp:getProperty name="product" property="albumart"/></td>
 </tr>

</table>
<% }
	else {
%>

<h2> Product submission failed, try again.</h2>

<%
	}
%>

<FORM METHOD="post" ACTION="list.jsp">
<INPUT TYPE="submit" VALUE="Back to products list">
</FORM>

<!-- end .page --></div>

<jsp:include page="footer.jsp" />
